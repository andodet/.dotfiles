return {
  {
    'DNLHC/glance.nvim',
    cmd = "Glance",
    config = function()
      vim.api.nvim_set_hl(0, "GlancePreviewNormal", { bg = "#333637" })
    end
  }
}
