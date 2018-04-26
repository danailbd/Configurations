""" INFUSION
syn keyword Type args method func funcName listener  changePath priority condition excludeSource includeSource namespace sources
syn keyword Type viewComponent component modelComponent fluid defaults registerNamespace
""" framework
syn keyword Special invokers events listeners options gradeNames model components dynamicComponents selectors modelListeners modelRelay members resources expander
" sub comp
syn keyword Special type createOnEvent container options
""" custom
syn keyword Type attrs template markup
" file specific
syn keyword Type widgetType widgetOptions

""" Testing
syn keyword Type changeEvent task jQueryTrigger jQueryBind expect name config sequence distributeOptions path modules tests
syn keyword Special jqUnit
syn keyword Type name expect tests modules sequence jQueryTrigger jQueryEvent element event spec
syn keyword Function assertDeepEq assertEquals assertTrue assertFalse
