( graph testfsm ( ( node N_2 delay_analysis ) 
( node N_1 model_checking ) 
( node N_4 done ) 
( node N_3 and ) ) 
( ( edge E_10 __ ( N_2 delayspec ) :type delay :encoding base64 :content QXV0b21hdGlvblJlcXVlc3RfaW4gOiBBdXRvbWF0aW9uUmVzcG9uc2Vfb3V0IDogOA== ) 
( edge E_11 __ ( N_2 delaypath ) :type delay :encoding base64 :content Y29ubmVjdGlvbiA6IEF1dG9tYXRpb25SZXF1ZXN0X2luIDogQXV0b21hdGlvblJlcXVlc3RWYWxpZGF0b3IuQ21kUmVxdWVzdF9pbiA6IDAKZmxvdyA6IEF1dG9tYXRpb25SZXF1ZXN0VmFsaWRhdG9yIDogQ21kUmVxdWVzdF9pbiA6IFN1YlJlcXVlc3Rfb3V0IDogMQpjb25uZWN0aW9uIDogQXV0b21hdGlvblJlcXVlc3RWYWxpZGF0b3IuU3ViUmVxdWVzdF9vdXQgOiBQbGFuQnVpbGRlci5DbWRSZXF1ZXN0X2luIDogMApmbG93IDogUGxhbkJ1aWxkZXIgOiBDbWRSZXF1ZXN0X2luIDogU3ViUmVxdWVzdF9vdXQgOiAxCmNvbm5lY3Rpb24gOiBQbGFuQnVpbGRlci5TdWJSZXF1ZXN0X291dCA6IFRhc2tTZXJ2aWNlQmFzZS5DbWRSZXF1ZXN0X2luIDogMApmbG93IDogVGFza1NlcnZpY2VCYXNlIDogQ21kUmVxdWVzdF9pbiA6IFN1YlJlcXVlc3Rfb3V0IDogMQpjb25uZWN0aW9uIDogVGFza1NlcnZpY2VCYXNlLlN1YlJlcXVlc3Rfb3V0IDogUm91dGVBZ2dyZWdhdG9yLkNtZFJlcXVlc3RfaW4gOiAwCmZsb3cgOiBSb3V0ZUFnZ3JlZ2F0b3IgOiBDbWRSZXF1ZXN0X2luIDogU3ViUmVxdWVzdF9vdXQgOiAxCmNvbm5lY3Rpb24gOiBSb3V0ZUFnZ3JlZ2F0b3IuU3ViUmVxdWVzdF9vdXQgOiBQbGFubmVyLkNtZFJlcXVlc3RfaW4gOiAwCg== ) 
( edge E_12 ( N_2 holds ) 
( N_3 in ) :type boolX :encoding base64 :content __ ) 
( edge E_13 ( N_2 explanation ) __ :type delay :encoding base64 :content __ ) 
( edge E_1 __ ( N_1 model ) :type nusmv :encoding base64 :content TU9EVUxFICJpbWwucG9ydHMuRmxvd1BvaW50IiANClZBUiB1cHBlckJvdW5kIDogImltbC5sYW5nLlJlYWwiICA7DQpWQVIgbG93ZXJCb3VuZCA6ICJpbWwubGFuZy5SZWFsIiAgOw0KVkFSIGV2ZW50IDogYm9vbGVhbiAgOw0KDQpNT0RVTEUgIlV4QVNSZXNwb25kc19wa2dGLlV4QVNfcmVzcG9uZHMiICggQXV0b21hdGlvblJlcXVlc3RfaW4gKQ0KVkFSIEF1dG9tYXRpb25SZXNwb25zZV9vdXQgOiAiaW1sLnBvcnRzLkV2ZW50RGF0YVBvcnQ8IGltbC5sYW5nLkJvb2wgPiIgIDsNClZBUiBkIDogImltbC5wb3J0cy5kZWxheSIgIDsNClZBUiBhZGVsYXltb25pdG9yIDogIlV4QVNSZXNwb25kc19wa2dGLm9uZV9yZXF1ZXN0X2F0X2FfdGltZSIgKEF1dG9tYXRpb25SZXNwb25zZV9vdXQuZmxvd3BvaW50LmV2ZW50LEF1dG9tYXRpb25SZXF1ZXN0X2luLmZsb3dwb2ludC5ldmVudCkgOw0KVkFSIHByb2Nlc3NpbmdfcGF0aCA6ICJpbWwucG9ydHMuRmxvd1BhdGgiICA7DQpWQVIgZ21vbml0b3IgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YucmVzcG9uZHNfb25jZSIgKEF1dG9tYXRpb25SZXNwb25zZV9vdXQuZXZlbnQsQXV0b21hdGlvblJlcXVlc3RfaW4uZXZlbnQpIDsNClZBUiBhbW9uaXRvciA6ICJVeEFTUmVzcG9uZHNfcGtnRi5vbmVfcmVxdWVzdF9hdF9hX3RpbWUiIChBdXRvbWF0aW9uUmVzcG9uc2Vfb3V0LmV2ZW50LEF1dG9tYXRpb25SZXF1ZXN0X2luLmV2ZW50KSA7DQoNCkRFRklORSBhIDo9ICggYW1vbml0b3IuaG9sZHMgICYgIGFkZWxheW1vbml0b3IuaG9sZHMgICkgOw0KREVGSU5FIGcgOj0gKCBnbW9uaXRvci5ob2xkcyAgJiAgZC5ob2xkcyAgKSA7DQoNCklOVkFSICggKCAgcHJvY2Vzc2luZ19wYXRoLnN0YXJ0LmV2ZW50ID0gIEF1dG9tYXRpb25SZXF1ZXN0X2luLmV2ZW50ICAgJiAgIHByb2Nlc3NpbmdfcGF0aC5lbmQuZXZlbnQgPSAgQXV0b21hdGlvblJlc3BvbnNlX291dC5ldmVudCAgICkgKSAgOw0KDQpNT0RVTEUgIlV4QVNSZXNwb25kc19wa2dGLkdlbmVyaWNMYXN0U2VydmljZU5vRGVsYXkiICggQ21kUmVxdWVzdF9pbiApDQpWQVIgQ21kUmVzcG9uc2Vfb3V0IDogImltbC5wb3J0cy5FdmVudERhdGFQb3J0PCBpbWwubGFuZy5Cb29sID4iICA7DQpWQVIgZ21vbml0b3IgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YucmVzcG9uZHNfb25jZSIgKENtZFJlc3BvbnNlX291dC5ldmVudCxDbWRSZXF1ZXN0X2luLmV2ZW50KSA7DQoNCkRFRklORSBnIDo9ICggZ21vbml0b3IuaG9sZHMgKSA7DQoNCk1PRFVMRSAiaW1sLnBvcnRzLmRlbGF5IiANCkRFRklORSBob2xkcyA6PSBUUlVFIDsNCg0KTU9EVUxFICJpbWwubGFuZy5SZWFsIiANCk1PRFVMRSAiVXhBU1Jlc3BvbmRzX3BrZ0Yub25lX3JlcXVlc3RfYXRfYV90aW1lIiAoIGEsICBiICkNClZBUiBzIDogeyJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMwIiwiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMSIsIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczIifSAgOw0KDQpERUZJTkUgc19pbml0IDo9ICggIHMgPSAgIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczAiICApIDsNCklOSVQgc19pbml0IDsNCg0KREVGSU5FIHNfdHJhbnMgOj0gKCBuZXh0KHMpPSAgY2FzZSANCglzPSAgIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczAiICAmICBiICA6ICJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMxIjsNCglzPSAgIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczEiICAmICBiICA6ICJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMyIjsNCglzPSAgIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczEiICAmICBhICAgJiAgIWIgIDogIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczAiOw0KCVRSVUUgOiBzOw0KZXNhYw0KICkgOw0KVFJBTlMgc190cmFucyA7DQoNCkRFRklORSBob2xkcyA6PSAoIHM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCIgIHwgIHM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMSIgICkgOw0KDQpNT0RVTEUgImltbC5wb3J0cy5FdmVudERhdGFQb3J0PCBpbWwubGFuZy5Cb29sID4iIA0KVkFSIGRhdGEgOiBib29sZWFuICA7DQpWQVIgZmxvd3BvaW50IDogImltbC5wb3J0cy5GbG93UG9pbnQiICA7DQpWQVIgZXZlbnQgOiBib29sZWFuICA7DQoNCk1PRFVMRSAiVXhBU1Jlc3BvbmRzX3BrZ0YucmVzcG9uZHNfb25jZSIgKCBhLCAgYiApDQpWQVIgcyA6IHsiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCIsIlV4QVNSZXNwb25kc19wa2dGLlJlc3BvbmRzU3RhdGUuczEiLCJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMyIn0gIDsNCg0KREVGSU5FIHNfaW5pdCA6PSAoIHM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCIgKSA7DQpJTklUIHNfaW5pdCA7DQoNCkRFRklORSBzdGF0ZV90cmFucyA6PSAoIG5leHQocyk9ICBjYXNlIA0KCXM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCIgICYgIGIgICAmICAhYSAgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMSI7DQoJcz0gICJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMwIiAgJiAgYSAgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMiI7DQoJcz0gICJVeEFTUmVzcG9uZHNfcGtnRi5SZXNwb25kc1N0YXRlLnMxIiAgJiAgYSAgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCI7DQoJVFJVRSA6IHM7DQplc2FjDQogKSA7DQpUUkFOUyBzdGF0ZV90cmFucyA7DQoNCkRFRklORSBob2xkcyA6PSAoIHM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMCIgIHwgIHM9ICAiVXhBU1Jlc3BvbmRzX3BrZ0YuUmVzcG9uZHNTdGF0ZS5zMSIgICkgOw0KDQpNT0RVTEUgIlV4QVNSZXNwb25kc19wa2dGLlV4QVNfcmVzcG9uZHNfZG90X2kiICggQXV0b21hdGlvblJlcXVlc3RfaW4gKQ0KVkFSIEF1dG9tYXRpb25SZXF1ZXN0VmFsaWRhdG9yIDogIlV4QVNSZXNwb25kc19wa2dGLkdlbmVyaWNTZXJ2aWNlIiAoQXV0b21hdGlvblJlcXVlc3RfaW4sUGxhbkJ1aWxkZXIuQ21kUmVzcG9uc2Vfb3V0KSA7DQpWQVIgQXV0b21hdGlvblJlc3BvbnNlX291dCA6ICJpbWwucG9ydHMuRXZlbnREYXRhUG9ydDwgaW1sLmxhbmcuQm9vbCA+IiAgOw0KVkFSIGQgOiAiaW1sLnBvcnRzLmRlbGF5IiAgOw0KVkFSIGFkZWxheW1vbml0b3IgOiAiVXhBU1Jlc3BvbmRzX3BrZ0Yub25lX3JlcXVlc3RfYXRfYV90aW1lIiAoQXV0b21hdGlvblJlc3BvbnNlX291dC5mbG93cG9pbnQuZXZlbnQsQXV0b21hdGlvblJlcXVlc3RfaW4uZmxvd3BvaW50LmV2ZW50KSA7DQpWQVIgVGFza1NlcnZpY2VCYXNlIDogIlV4QVNSZXNwb25kc19wa2dGLkdlbmVyaWNTZXJ2aWNlIiAoUGxhbkJ1aWxkZXIuU3ViUmVxdWVzdF9vdXQsUm91dGVBZ2dyZWdhdG9yLkNtZFJlc3BvbnNlX291dCkgOw0KVkFSIHByb2Nlc3NpbmdfcGF0aCA6ICJpbWwucG9ydHMuRmxvd1BhdGgiICA7DQpWQVIgZ21vbml0b3IgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YucmVzcG9uZHNfb25jZSIgKEF1dG9tYXRpb25SZXNwb25zZV9vdXQuZXZlbnQsQXV0b21hdGlvblJlcXVlc3RfaW4uZXZlbnQpIDsNClZBUiBQbGFubmVyIDogIlV4QVNSZXNwb25kc19wa2dGLkdlbmVyaWNMYXN0U2VydmljZU5vRGVsYXkiIChSb3V0ZUFnZ3JlZ2F0b3IuU3ViUmVxdWVzdF9vdXQpIDsNClZBUiBhbW9uaXRvciA6ICJVeEFTUmVzcG9uZHNfcGtnRi5vbmVfcmVxdWVzdF9hdF9hX3RpbWUiIChBdXRvbWF0aW9uUmVzcG9uc2Vfb3V0LmV2ZW50LEF1dG9tYXRpb25SZXF1ZXN0X2luLmV2ZW50KSA7DQpWQVIgUm91dGVBZ2dyZWdhdG9yIDogIlV4QVNSZXNwb25kc19wa2dGLkdlbmVyaWNTZXJ2aWNlIiAoVGFza1NlcnZpY2VCYXNlLlN1YlJlcXVlc3Rfb3V0LFBsYW5uZXIuQ21kUmVzcG9uc2Vfb3V0KSA7DQpWQVIgUGxhbkJ1aWxkZXIgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YuR2VuZXJpY1NlcnZpY2UiIChBdXRvbWF0aW9uUmVxdWVzdFZhbGlkYXRvci5TdWJSZXF1ZXN0X291dCxUYXNrU2VydmljZUJhc2UuQ21kUmVzcG9uc2Vfb3V0KSA7DQoNCkRFRklORSBhIDo9ICggYW1vbml0b3IuaG9sZHMgICYgIGFkZWxheW1vbml0b3IuaG9sZHMgICkgOw0KREVGSU5FIGcgOj0gKCBnbW9uaXRvci5ob2xkcyAgJiAgZC5ob2xkcyAgKSA7DQoNCklOVkFSICggKCAgcHJvY2Vzc2luZ19wYXRoLnN0YXJ0LmV2ZW50ID0gIEF1dG9tYXRpb25SZXF1ZXN0X2luLmV2ZW50ICAgJiAgIHByb2Nlc3NpbmdfcGF0aC5lbmQuZXZlbnQgPSAgQXV0b21hdGlvblJlc3BvbnNlX291dC5ldmVudCAgICkgKSAgOw0KSU5WQVIgIEF1dG9tYXRpb25SZXF1ZXN0VmFsaWRhdG9yLkNtZFJlc3BvbnNlX291dC5ldmVudCA9ICBBdXRvbWF0aW9uUmVzcG9uc2Vfb3V0LmV2ZW50ICYgICBBdXRvbWF0aW9uUmVxdWVzdFZhbGlkYXRvci5DbWRSZXNwb25zZV9vdXQuZGF0YSA9ICBBdXRvbWF0aW9uUmVzcG9uc2Vfb3V0LmRhdGEgJiAgIEF1dG9tYXRpb25SZXF1ZXN0VmFsaWRhdG9yLkNtZFJlc3BvbnNlX291dC5mbG93cG9pbnQuZXZlbnQgPSAgQXV0b21hdGlvblJlc3BvbnNlX291dC5mbG93cG9pbnQuZXZlbnQgICA7DQoNCk1PRFVMRSAiaW1sLnBvcnRzLkZsb3dQYXRoIiANClZBUiB1cHBlckJvdW5kIDogImltbC5sYW5nLlJlYWwiICA7DQpWQVIgc3RhcnQgOiAiaW1sLnBvcnRzLkZsb3dQb2ludCIgIDsNClZBUiBlbmQgOiAiaW1sLnBvcnRzLkZsb3dQb2ludCIgIDsNClZBUiBsb3dlckJvdW5kIDogImltbC5sYW5nLlJlYWwiICA7DQoNCk1PRFVMRSAiaW1sLnBvcnRzLlBvcnQiIA0KTU9EVUxFICJVeEFTUmVzcG9uZHNfcGtnRi5HZW5lcmljU2VydmljZSIgKCBDbWRSZXF1ZXN0X2luLCAgU3ViUmVzcG9uc2VfaW4gKQ0KVkFSIGcxbW9uaXRvciA6ICJVeEFTUmVzcG9uZHNfcGtnRi5yZXNwb25kc19vbmNlIiAoU3ViUmVxdWVzdF9vdXQuZXZlbnQsQ21kUmVxdWVzdF9pbi5ldmVudCkgOw0KVkFSIHByb2Nlc3NpbmdfcGF0aDEgOiAiaW1sLnBvcnRzLkZsb3dQYXRoIiAgOw0KVkFSIENtZFJlc3BvbnNlX291dCA6ICJpbWwucG9ydHMuRXZlbnREYXRhUG9ydDwgaW1sLmxhbmcuQm9vbCA+IiAgOw0KVkFSIFN1YlJlcXVlc3Rfb3V0IDogImltbC5wb3J0cy5FdmVudERhdGFQb3J0PCBpbWwubGFuZy5Cb29sID4iICA7DQpWQVIgcHJvY2Vzc2luZ19wYXRoMCA6ICJpbWwucG9ydHMuRmxvd1BhdGgiICA7DQpWQVIgZzJtb25pdG9yIDogIlV4QVNSZXNwb25kc19wa2dGLnJlc3BvbmRzX29uY2UiIChDbWRSZXNwb25zZV9vdXQuZXZlbnQsU3ViUmVzcG9uc2VfaW4uZXZlbnQpIDsNClZBUiBkMSA6ICJpbWwucG9ydHMuZGVsYXkiICA7DQpWQVIgZDIgOiAiaW1sLnBvcnRzLmRlbGF5IiAgOw0KDQpERUZJTkUgZyA6PSAoIGcxbW9uaXRvci5ob2xkcyAgJiAgZzJtb25pdG9yLmhvbGRzICAgJiAgZDEuaG9sZHMgICAmICBkMi5ob2xkcyAgKSA7DQoNCklOVkFSICggKCAgcHJvY2Vzc2luZ19wYXRoMC5zdGFydC5ldmVudCA9ICBDbWRSZXF1ZXN0X2luLmV2ZW50ICAgJiAgIHByb2Nlc3NpbmdfcGF0aDAuZW5kLmV2ZW50ID0gIFN1YlJlcXVlc3Rfb3V0LmV2ZW50ICAgKSApICA7DQpJTlZBUiAoICggIHByb2Nlc3NpbmdfcGF0aDEuc3RhcnQuZXZlbnQgPSAgU3ViUmVzcG9uc2VfaW4uZXZlbnQgICAmICAgcHJvY2Vzc2luZ19wYXRoMS5lbmQuZXZlbnQgPSAgQ21kUmVzcG9uc2Vfb3V0LmV2ZW50ICAgKSApICA7DQoNCg0KCk1PRFVMRSBtYWluIA0KVkFSIGluc3QgOiAiVXhBU1Jlc3BvbmRzX3BrZ0YuVXhBU19yZXNwb25kc19kb3RfaSIgKEF1dG9tYXRpb25SZXF1ZXN0X2luKSA7DQpWQVIgQXV0b21hdGlvblJlcXVlc3RfaW4gOiAiaW1sLnBvcnRzLkV2ZW50RGF0YVBvcnQ8IGltbC5sYW5nLkJvb2wgPiIgIDsNCg0K ) 
( edge E_2 __ ( N_1 property ) :type nusmv :encoding base64 :content TFRMU1BFQyAhRyhpbnN0LmEgICYgICggVFJVRSAgLT4gIGluc3QuQXV0b21hdGlvblJlcXVlc3RWYWxpZGF0b3IuZyAgKSAgICYgICggVFJVRSAgLT4gIGluc3QuUGxhbkJ1aWxkZXIuZyAgKSAgICYgICggVFJVRSAgLT4gIGluc3QuVGFza1NlcnZpY2VCYXNlLmcgICkgICAmICAoIFRSVUUgIC0+ICBpbnN0LlJvdXRlQWdncmVnYXRvci5nICApICAgJiAgKCBUUlVFICAtPiAgaW5zdC5QbGFubmVyLmcgICkgKSB8IEcoaW5zdC5nKSA7IA== ) 
( edge E_3 ( N_1 holds ) 
( N_3 in ) :type boolX :encoding base64 :content __ ) 
( edge E_4 ( N_1 cexample ) __ :type nusmv :encoding base64 :content __ ) 
( edge E_14 ( N_3 out ) 
( N_4 in ) :type boolX :encoding base64 :content __ ) ) )