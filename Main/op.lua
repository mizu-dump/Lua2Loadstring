-- Hyper Extremo Seguro - Optimización cliente (Morel & GPT-5)
-- Uso: Delta executor. Cliente-only. No modifica servidores ni hace invisible a nadie.
-- Activa: automáticamente al cargar. Toggle manual: RightControl.

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ===== Guardar valores originales (para restaurar si es necesario) =====
local original = {}
pcall(function()
	original.Quality = settings().Rendering.QualityLevel
	original.GlobalShadows = Lighting.GlobalShadows
	original.Brightness = Lighting.Brightness
	original.EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale
	original.EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale
	original.FogEnd = Lighting.FogEnd
	original.Ambient = Lighting.Ambient
	original.OutdoorAmbient = Lighting.OutdoorAmbient
	original.FieldOfView = camera.FieldOfView
end)

-- ===== GUI FPS + Ping pequeño y movible =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HyperPerfGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = (game:GetService("CoreGui") or StarterGui)

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0,160,0,56)
frame.Position = UDim2.new(0.02,0,0.08,0)
frame.BackgroundTransparency = 0.35
frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local fpsLabel = Instance.new("TextLabel", frame)
fpsLabel.Size = UDim2.new(1,0,0.5,0)
fpsLabel.Position = UDim2.new(0,0,0,0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.Code
fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
fpsLabel.Text = "FPS: ..."

local pingLabel = Instance.new("TextLabel", frame)
pingLabel.Size = UDim2.new(1,0,0.5,0)
pingLabel.Position = UDim2.new(0,0,0.5,0)
pingLabel.BackgroundTransparency = 1
pingLabel.TextScaled = true
pingLabel.Font = Enum.Font.Code
pingLabel.TextColor3 = Color3.fromRGB(0,200,255)
pingLabel.Text = "Ping: ..."

-- ===== Estado y ajustes máximos =====
local hyperOn = true
local lastUpdate = tick()
local frameCount = 0

local function applyAggressiveOptimizations()
	-- Calidad mínima
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	end)

	-- Lighting agresivo (local)
	pcall(function()
		Lighting.GlobalShadows = false
		Lighting.EnvironmentDiffuseScale = 0
		Lighting.EnvironmentSpecularScale = 0
		Lighting.FogEnd = 1e6
		Lighting.Brightness = 1
		Lighting.Ambient = Color3.fromRGB(120,120,120)
		Lighting.OutdoorAmbient = Color3.fromRGB(100,100,100)
	end)

	-- Cámara: bajar FOV ligeramente (reduce cálculos de postprocess locales)
	pcall(function()
		camera.FieldOfView = 70
	end)
end

local function restoreOriginals()
	pcall(function()
		if original.Quality then settings().Rendering.QualityLevel = original.Quality end
		if original.GlobalShadows ~= nil then Lighting.GlobalShadows = original.GlobalShadows end
		if original.EnvironmentDiffuseScale then Lighting.EnvironmentDiffuseScale = original.EnvironmentDiffuseScale end
		if original.EnvironmentSpecularScale then Lighting.EnvironmentSpecularScale = original.EnvironmentSpecularScale end
		if original.FogEnd then Lighting.FogEnd = original.FogEnd end
		if original.Brightness then Lighting.Brightness = original.Brightness end
		if original.Ambient then Lighting.Ambient = original.Ambient end
		if original.OutdoorAmbient then Lighting.OutdoorAmbient = original.OutdoorAmbient end
		if original.FieldOfView then camera.FieldOfView = original.FieldOfView end
	end)
end

-- ===== Función que desactiva efectos pesados en el workspace (y en nuevos objetos) =====
local function disableHeavyLocalEffects(instance)
	-- Desactiva emitters y efectos locales sin destruir objetos
	if instance:IsA("ParticleEmitter") or instance:IsA("Trail") or instance:IsA("Beam") then
		pcall(function() instance.Enabled = false end)
	elseif instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Sparkles") then
		pcall(function() instance.Enabled = false end)
	elseif instance:IsA("PostEffect") or instance:IsA("DepthOfFieldEffect") or instance:IsA("BloomEffect")
			or instance:IsA("SunRaysEffect") or instance:IsA("ColorCorrectionEffect") then
		pcall(function() instance.Enabled = false end)
	end
end

-- Desactivar ya existentes (una pasada)
for _, v in pairs(workspace:GetDescendants()) do
	disableHeavyLocalEffects(v)
end
for _, v in pairs(Lighting:GetDescendants()) do
	disableHeavyLocalEffects(v)
end

-- Conectar para nuevos objetos que se creen
workspace.DescendantAdded:Connect(function(obj)
	disableHeavyLocalEffects(obj)
end)
Lighting.DescendantAdded:Connect(function(obj)
	disableHeavyLocalEffects(obj)
end)

-- ===== Revisión periódica para forzar cambios si algo se reactiva =====
RunService.Heartbeat:Connect(function()
	-- Mantener hyper activo si está on
	if hyperOn then
		applyAggressiveOptimizations()
	end

	-- FPS & Ping contador
	frameCount = frameCount + 1
	local now = tick()
	if now - lastUpdate >= 1 then
		local fps = math.floor(frameCount / (now - lastUpdate))
		frameCount = 0
		lastUpdate = now
		fpsLabel.Text = "FPS: " .. fps

		local ping = 0
		pcall(function()
			ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
		end)
		pingLabel.Text = "Ping: " .. tostring(ping) .. " ms"
	end
end)

-- ===== Toggle rápido con RightControl para desactivar/activar (útil para probar) =====
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		hyperOn = not hyperOn
		if hyperOn then
			applyAggressiveOptimizations()
			print("[HYPER] Activado")
		else
			restoreOriginals()
			print("[HYPER] Desactivado (restaurando)")
		end
	end
end)

print("[HYPER] Script Hyper Extremo Seguro cargado. RightCtrl = toggle.")