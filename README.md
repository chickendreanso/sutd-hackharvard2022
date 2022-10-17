# Inspiration
The goal of Sonr is in empowering users to be able to have true digital ownership of their data connected with our team. By tapping on Sonr's network and analyzing the data in the hands of their owners, we generate value and offer users insights into themselves as digitally connected beings, all in a decentralized manner.

# What it does
Diffusion is a data visualization platform for users to visualize data from their other decentralized applications (dApps) on the Sonr blockchain. Users can choose which dApps they wish to connect to Diffusion, before the AI model analyzes the data and brings attention to potential trends in the user's behavior on the dApps. At the end of the analysis, the input data is not stored on our platform to ensure that the privacy of the user is maintained.

# How we built it
Our brainstorming sessions were conducted in Miro before we began building a lofi prototype of the mobile application in Figma. Sentence-transformers were used to build our AI model and also perform the chat summary feature. Google app engine was then used to deploy our AI model and allow our Flutter application to make API calls to fetch the data before visualizing it on the application using Syncfusion.

# Challenges we ran into
As Sonr's native messaging application Beam was not yet released to the public, we exported chat history from Telegram to act as the pseudo-dataset as a proof-of-concept.

We were also limited by what the Sonr blockchain could offer. For example, we initially intended to enable users to voluntarily share their data and use that information to aggregate averages and provide more meaningful insights into their personal habits. However, there is currently no way for you to give permission to others to access your data.

Additionally, the existing schemas available on the Sonr blockchain were not suitable for our use case which required machine learning i.e. Lists were not yet supported. Hence, we had to switch to deploying APIs with Flask / App Engine to allow our frontend to query data schemas.

# Accomplishments that we're proud of
Given the limited time and many issues we faced, we are proud that we still managed to adapt our application to still function as intended. Additionally, the team was relatively new to Flutter and we had to quickly learn and adapt to the native Dart programming language. Through pair programming, we managed to code quickly and efficiently, allowing us to cover the many components of our application.

# What we learned
With how new the Web3 space is, we have to constantly learn and adapt to problems and bugs that we face as there is not much help and documentation available for reference.

# What's next for Diffusion.io
As Sonr rolls out more dApps in their ecosystem, support for these dApps should follow suit. Additional metrics that the model will be able to predict can also be constantly developed by improving our AI model.

Built With
- figma
- flutter
- github
- google-app-engine
- google-cloud-sdk
- miro
- openai
- python
- sentence-transformers
- #sonr
- syncfusion
