import SwiftUI

struct StokeDetailView: View {
    let stoke: Stoke

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Stoke Image
                Image(getImage(for: stoke.name))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(15)
                    .padding(.horizontal)

                // Title of the Stoke
                Text(stoke.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.horizontal)

                // Purpose Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Purpose")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    Text(stoke.purpose)
                        .font(.body)
                        .padding(.horizontal)
                        .foregroundColor(Color.secondary)
                }

                // Participants Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Number of Participants")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    Text(stoke.participants)
                        .font(.body)
                        .padding(.horizontal)
                        .foregroundColor(Color.secondary)
                }

                // Instructions Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    Text(getInstructions(for: stoke.name))
                        .font(.body)
                        .padding(.horizontal)
                        .foregroundColor(Color.secondary)
                }

                Spacer()
            }
            .padding(.bottom, 20)
        }
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
        .navigationTitle("Stoke Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    private func getImage(for stokeName: String) -> String {
           switch stokeName {
           case "I'm a Tree": return "misnamer"
           case "Alphabet Soup": return "alphabet-soup"
           case "Category, Category, Die!": return "category-category-die"
           case "Rock-Paper-Scissors War": return "rock-paper"
           case "Lemonade": return "lemonade"
           case "Accelerating Introductions": return "accelerating-introductions"
           case "Blind Disco": return "blind-disco"
           case "Yes, Let's": return "yes-lets"
           case "Story Swap": return "story-swap"
           case "Misnamer": return "misnamer"
           case "Origin Story": return "origin-story"
           case "Name Tag": return "name-tag"
           case "Three-headed Expert": return "three-headed-expert"
           case "Fail Test": return "fail-test"
           case "Remember When...?": return "remember-when"
           case "How are you, really?": return "how-are-you-really"
           case "1713": return "1713"
           case "Rapid Fire Teams": return "rapid-fire-teams"
           case "Gesture Name Game": return "gesture"
           case "Convergence": return "convergence"
           case "Awkward Silence": return "awkward-silence"
           case "The Wind Blows": return "the-wind-blows"
           case "Yee-Haw!": return "yee-haw"
           case "Yes, and...": return "how-are-you-really"
           case "Long Lost Friends": return "long-lost-friends"
           case "Soundball": return "soundball"
           case "One Word Proverbs": return "one-word-proverbs"
           case "The Shakedown": return "the-shakedown"
           default: return "placeholder-image"
           }
       }
   }
    // Function to get instructions based on the Stoke name
    private func getInstructions(for stokeName: String) -> String {
        switch stokeName {
        case "I'm a Tree":
            return """
            Circle up.
            Someone goes to center and says “I’m a tree!” and impersonates a tree.
            Another person joins the tree and says “I’m a nut!” and impersonates a nut.
            A third participant enters and says “I’m a squirrel!” and impersonates a squirrel.
            The tree and nut exit the scene, and two new people enter, building a new scene around the squirrel (that might have nothing to do with trees or nuts!)
            Continue until everyone has participated!
            """
        case "Alphabet Soup":
            return """
            Someone shouts out the letter “A.”
            The group attempts to progress through the alphabet at random, one letter at a time, without the same letter being shouted at once.
            If the same letter is shouted at once by multiple people, you start over at “A”!
            See if you can get the whole alphabet! If that’s too easy, see how high you can get using numbers!
            """
        case "Category, Category, Die!":
            return """
            Circle up.
            Facilitator chooses a category (e.g. types of tree or cereal brands).
            Go around the circle with each person giving an example from the category (e.g. Maple or Trix)
            When someone can’t think of one or repeats one that’s been said, they’re out!
            Tip: Add another category moving in the opposite direction for an extra challenge!
            """
        case "Rock-Paper-Scissors War":
            return """
            Partner up.
            Play rock-paper-scissors.
            Winner moves on to challenge another winner; loser becomes winner’s biggest fan and must cheer as loudly as they can in subsequent rounds.
            Continue until you have half the group on each side for the final match!
            Tip: agree on rules of rock-paper-scissors before you start!
            """
        case "Lemonade":
            return """
            Circle up.
            Someone states a “lemon” - a bummer about their day or week (e.g. “I spilled coffee on my pants this morning”).
            The next person turns that into “lemonade” by looking on the bright side (e.g. “But now you have a great new pattern on your pants!”).
            The next person states a new “lemon,” and the cycle continues around the circle.
            """
        case "Accelerating Introductions":
            return """
            Partner up.
            Partners introduce themselves to each other in 2 minutes.
            Pair up with another pair.
            In 1 minute total, everyone introduces their partner to the group of 4.
            Pair up with another quad.
            In 30 seconds total, everyone introduces their partner to the group of 8.
            Continue doubling the group size and halving the time until you have one big group and not enough time!
            """
        case "Blind Disco":
            return """
            Everyone closes their eyes.
            Facilitator plays a funky jam.
            Everyone dances like no one is watching — because no one is!
            """
        case "Yes, Let's":
            return """
            Someone makes an offer to the group (e.g. “Let’s be baby birds!” or “Let’s act like we don’t understand gravity!”).
            Everyone replies with “Yes, let’s!” and then acts out the suggestion.
            Anyone yells out the next offer at any time!
            """
        case "Story Swap":
            return """
            Partner up.
            Partner A tells Partner B a 30 second story about a recent experience of theirs.
            Partner B retells Partner A’s story in first person back to Partner A in 30 seconds.
            Partner B tells partner A a 30 second story about a recent experience of theirs.
            Partner A retells Partner B’s story in first person but has 60 seconds - so they must embellish!
            """
        case "Misnamer":
            return """
            Partner up.
            Walk around and switch off pointing at something and calling it anything BUT what it actually is (e.g. point at an eraser and say “Look, a pizza!”).
            """
        case "Origin Story":
            return """
            Partner up.
            Each partner tells the story of how and why they got their name.
            Pairs can share out stories with the group when time is up.
            """
        case "Name Tag":
            return """
            Circle up (shoulder to shoulder!).
            One person volunteers to be “it” and steps to the middle of the circle.
            Someone calls out the name of someone else in the circle.
            Person in middle must tag the person whose name was called before that person says someone else’s name.
            This continues until the “it” person tags someone before they can name someone else. When they do, they switch places.
            """
        case "Three-headed Expert":
            return """
            Identify three people to be your “three-headed expert.”
            Identify two things in the room (e.g. skateboard and iPad).
            The three-headed expert now shares their expertise on “skateboard-iPads” one word at a time!
            """
        case "Fail Test":
            return """
            Partner up.
            Round One: Each pair counts to 3, switching off saying each number. “1,” “2,” “3,” “1,”… Go as fast as you can!
            Round Two: Same as Round One but replace your 1’s with claps!
            Round Three: Same as Round Two but replace your 2’s with snaps!
            Round Four: Same as Round Three but replace your 3’s with stomps!
            Tip: Encourage participants to cheer when they mess up!
            """
        case "Remember When...?":
            return """
            Partner up.
            Partner A begins with “Remember when…” and then states the beginning of a (fake) shared memory (e.g. “…we drove to Santa Cruz?”).
            Partner B builds on the memory with “Yeah, and then…” (e.g. “…we rented surfboards?”).
            Partners continue adding on to their “memory” until they’re satisfied!
            """
        case "How are you, really?":
            return """
            Everyone gets post-its and a Sharpie.
            Facilitator asks the group “How are you, really?”
            Each person writes their answers on post-its and sticks them to their shirts (e.g. tired, anxious, excited, thirsty, etc.).
            Everyone mingles, discussing stickies that prompt conversation.
            """
        case "1713":
            return """
            Partner up.
            Partner A is from the year 1713 and knows nothing about today’s world or technologies. Partner B is him/herself.
            Facilitator states a product or concept from present day and Partner B attempts to explain it to Partner A in 5 minutes.
            Roles reverse and a new product or concept is given: Partner A attempts to explain to Partner B in 5 minutes.
            """
        case "Rapid Fire Teams":
            return """
            Everyone mingles and creates shared experiences with multiple partners in multiple rounds:
            - Make a secret handshake with your partner.
            - Make up a nickname for a new partner.
            - Make up a life motto together with a new partner.
            - Make up your own!
            """
        case "Gesture Name Game":
            return """
            Circle up.
            Each person states their name and accompanies it with a gesture or motion of their choice.
            The group repeats each name and gesture/ motion after each person. It’s a fun remix of the traditional name game.
            """
        case "Convergence":
            return """
            The goal of this activity is to converge on a single word after starting with two random, unrelated words. To play:
            - Two people volunteer to start. They count down from 3 and then say one random word each.
            - The first two people who think of a word related to both previous words say “Got it!” and say their words simultaneously after counting down from 3.
            Eventually, two people will say the same word, and the group has converged!
            """
        case "Awkward Silence":
            return """
            Partner up.
            Each pair stares into each other’s eyes for 15 seconds.
            Pairs now begin conversations (facilitator can choose topic), except they must wait 15 seconds before every response, during which they don’t lose eye contact!
            """
        case "The Wind Blows":
            return """
            Circle up with one person in the middle.
            The person in the middle says “The wind blows for everyone who…” and then states something that is also true about him/herself.
            Anyone to whom that statement pertains must find a new spot in the circle.
            """
        case "Yee-Haw!":
            return """
            This is an elimination game built on the passing of motions and phrases around a circle. Introduce the motions/phrases one at a time, with a brief practice round after each.
            - Say “Yee-haw!” and swing your arm to point in the direction you’re passing.
            - Say “Reee-verse!” and pump your fist to send it back in the other direction.
            - Say “Hay barn!” and clap your hands over your head to skip the next person in the circle.
            - Say “Get down, little doggy!” and point to anyone in the circle to dance with them in the center while everyone claps a beat, then switch spots with them in the circle.
            """
        case "Yes, and...":
                return """
                Partner up.
                Facilitator introduces a theme (e.g. party or vacation planning).
                Partner A suggests an idea within the theme.
                Partner B builds on that idea, starting their sentence with “Yes, and…”
                Partners continue to build off each other until time is up!
                """
            case "Long Lost Friends":
                return """
                Everyone wanders around and people stop to greet a partner according to a scenario that the facilitator calls out. The facilitator calls out…
                - Your partner is a long-lost friend.
                - You’re 70% sure your partner is famous.
                - You shared an awkward first date last week with your partner.
                - Make up your own!
                """
            case "Soundball":
                return """
                Circle up.
                Make a sound and throw an imaginary ball to someone.
                Recipient catches the ball and repeats sound. Then they make a new sound and throw the ball to a different person.
                To make it harder, add new categories and play with multiple balls at once!
                """
            case "One Word Proverbs":
                return """
                Circle up.
                Someone begins a “proverb” by saying one word.
                The person next to them continues the “proverb” with another word.
                Keep moving around the circle until the proverb feels complete, at which point everyone taps their fingers together and says “yesyesyesyesyes…”
                """
            case "The Shakedown":
                return """
                Facilitator says:
                - Everyone stand up!
                - Shake out your right arm 8 times, counting down from 8.
                - Shake out your left arm 8 times, counting down from 8.
                - Shake out your right leg 8 times, counting down from 8.
                - Shake out your left leg 8 times, counting down from 8.
                - Repeat the progression for 7, then 6, then 5, 4, 3, 2, 1!
                """
        default:
            return "Instructions are not available for this activity."
        }
    }

struct StokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StokeDetailView(stoke: Stoke(
            name: "Fail Test",
            participants: "2-40",
            purpose: "Create Focus or Communicate a Mindset",
            category: "Team Building"
        ))
    }
}

