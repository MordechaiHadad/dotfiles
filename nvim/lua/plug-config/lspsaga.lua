local saga = require("lspsaga")
saga.init_lsp_saga({
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
        virtual_text = false,
    },
})
