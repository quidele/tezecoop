'Template Method

'Motivation
'If we take a look at the dictionary definition of a template we can see that a template is a preset format, 
' used as a starting point for a particular application so that the format does not have to be recreated each time it is used.
'On the same idea is the template method is based. A template method defines an algorithm in a base class using abstract 
' operations that subclasses override to provide concrete behavior.



'/* creamos una clase abstracta  */
Public MustInherit Class Criteria

    '/*  creamos un metodo abstracto*/
    Public MustOverride Function ejecutar() As String


End Class
