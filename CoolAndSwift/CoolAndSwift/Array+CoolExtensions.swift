extension Array
{
    func perform(closure: (Element) -> ())
    {
        for currElement in self {
            closure(currElement)
        }
    }
}

