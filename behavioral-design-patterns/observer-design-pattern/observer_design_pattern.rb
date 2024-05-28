# The subject maintains a list of observers and notifies them of any state changes.
class Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end

# The observer interface (or a contract) defines the method that observers must implement to receive updates from the subject.
module Observer
  def update(subject)
    raise NotImplementedError, 'Observers must implement the update method'
  end
end

#  Create Concrete Observers: Concrete observers implement the observer interface and define specific update logic.
class ConcreteObserver1
  include Observer

  def update(subject)
    puts "ConcreteObserver1: Reacted to the event from #{subject}"
  end
end

class ConcreteObserver2
  include Observer

  def update(subject)
    puts "ConcreteObserver2: Reacted to the event from #{subject}"
  end
end


#  Extend the Subject with State Changes: The subject should have some state and notify observers whenever the state changes.
class ConcreteSubject < Subject
  attr_accessor :state

  def initialize
    super()
    @state = 0
  end

  def change_state(new_state)
    @state = new_state
    puts "Subject: State has changed to #{new_state}"
    notify_observers
  end
end

# Create a subject, attach observers to it, and change the state to see the observers react.

# Create a subject
subject = ConcreteSubject.new

# Create observers
observer1 = ConcreteObserver1.new
observer2 = ConcreteObserver2.new

# Attach observers to the subject
subject.add_observer(observer1)
subject.add_observer(observer2)

# Change the state of the subject to notify observers
subject.change_state(1)
subject.change_state(2)

# Remove an observer
subject.remove_observer(observer1)

# Change the state of the subject again
subject.change_state(3)
