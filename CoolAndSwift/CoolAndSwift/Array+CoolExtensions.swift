extension Array
{
    func perform(closure: (T) -> ())
    {
        for currElement in self {
            closure(currElement)
        }
    }
}

