# DSKMFCoreOntology$ REPOSITORY= NAME= DOMAIN= ruby add_type.rb

name = ENV['NAME']
extension = 'sRawContent'
domain = ENV['DOMAIN']
repository = ENV['REPOSITORY']

files = {}

files[name] = "{{ComponentType2
|HasKeyword=
}}[[Category:#{domain}Ontology]]"

files["Template:#{domain} #{name}"] = "<includeonly>{{METADATA|Keywords={{{HasKeyword|}}}}}

{{RegularProperty|PropertyName=HasSubjectType|PropertyValue=#{name}}}

{{DISPLAYTITLE:#{name} \"{{{HasTitle}}}\"}}
{{#default_form:IBG#{name}}}</includeonly>
<noinclude>[[Category:#{domain}Ontology]]</noinclude>"

files["Form:#{name}"] = "{{{info|add title=Add #{name}|edit title=Edit #{name}|page name=C<unique number;random;10>}}}

{{{for template|IBG #{name}}}}
  {|class=formtable
    !Title
    |{{{field|HasTitle|input type=text}}}
    |-
    !Keywords
    |{{{field|HasKeyword|input type=tokens|delimiter=;|values from property=HasKeyword}}}
  |}
{{{end template}}}

{{ForTemplateMotivation}}

{{ForTemplateIrregularProperty}}

{{ForTemplateContext}}

{{FormFooter}}
[[Category:#{domain}Ontology]]"

files.each do |name, content|
  open("#{repository}/objects/#{domain} #{name}.#{extension}", 'w') do |f|
    f.puts content
  end
end
