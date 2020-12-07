---
title: "Poodles and Doodles Part 1: An Introduction to Bias in Machine Learning Systems"
description: "Part one in a series of posts about bias in machine learning systems, illustrated through the construction of a model to classify dogs as either poodles or doodles."
layout: post
toc: false
comments: true
image: images/blog_posts/poodles-and-doodles/avatar.jpg
hide: false
search_exclude: false
---

## Introduction

In a [recent panel at the Schwarzman College of Computing](https://www.youtube.com/watch?v=Sm7I4QjscVQ&feature=share), Joi Ito (then director of the [MIT Media Lab](https://www.media.mit.edu/)) gave an interesting comment about the implementation of AI in the real world:

> I think of AI as sort of jetpacks and blindfolds, that are going to come in and send us careening in whatever direction we're already headed in. It's going to make us more powerful, but not necessarily more wise. And I think that the key thing is to get our house in order before the jetpacks come on.

I agree with Ito. However, I think the jetpacks and blindfolds are already here. Machine learning models are already being used to make many of the highest-impact decisions in society:

[Who is able to get a loan to start a small business?](https://hbr.org/2020/11/ai-can-make-bank-loans-more-fair?ab=hero-main-text)

[Who is able to get a job interview?](https://arxiv.org/abs/1906.09208)

[Who gets sent to jail?](https://www.technologyreview.com/2019/10/17/75285/ai-fairer-than-judge-criminal-risk-assessment-algorithm/)

Companies often claim that using machine learning models in decision-making processes will eliminate bias, and make decisions more objective by relying on logic and math rather than human judgement and emotion. However, without proper practices in place, these models can perpetuate existing biases, or introduce new biases. As a result, the human biases that have been studied for hundreds of years are replaced with complex algorithmic biases, which are often hidden and difficult to diagnose.

In recent years, lots of information about bias in machine learning systems has become available. However, much of this content is aimed at either researchers or the general public. Many people find this content to be either too deep or too shallow to be truly insightful. **In this series of blog posts, I aim to illustrate some of the important stumbling blocks that lead to biased machine learning systems by building, critiquing, and refining a an actual machine learning model.** In particular, I will build a convolutional neural network to classify dogs as either being poodles or doodles. Along the way, I will provide references to further resources for those interested in a deeper understanding of any particular topic.  

In this post, I will lay the groundwork for future posts by outlining the basic stages that are used to build machine learning models, and briefly cover how each can be a source of bias. In future posts, I will build on this, demonstrating how to spot and resolve these issues in the real world.

## How Bias Emerges in Machine Learning Systems

To understand how bias is introduced in machine learning systems, it is helpful to have a basic understanding of how these systems are built. At the core, machine learning can be defined as the process of training a computer to optimize some goal/metric through the following three stages:

![]({{ site.url }}{{ site.baseurl }}/images/blog_posts/poodles-and-doodles/stages.png)


> **Note**: this is a pretty big simplification — real machine learning systems are often much more complex, with loops and dependencies along the way. However, I do not believe that level of detail is useful here.

Each of these stages can be a source of bias. Each machine learning system will be unique in construction and application, so in this post I will focus on *questions to ask* along the way, rather than *rules to follow.* 

### Stage 1 (Data Collection)

In Stage 1, data is collected from some **population**, or group of interest. The data will typically contain **features** (measured variables, such as *work history* or *income*) and **labels** (the output of interest, such as *spam/not spam* or *benign/malignant*). Here are some questions to ask during this stage:

- **All data is imperfect. Is that being considered?**  All datasets are created in a historical context, and all contain measurement errors. These characteristics are not always apparent, and should be assessed before deciding to move forward with a given dataset. 

- **Is the sampled data representative of the entire population?** If the data disproportionately represents users from any  particular demographic (such as young social media users from the United States), it should not be treated as an accurate representation of the entire global population. Without proper consideration, this can lead to a model that does not generalize well when applied in the real world. This is commonly referred to as **representation bias**.
  
- **Does the data reflect existing biases?** Even with proper sampling, datasets may serve as an accurate representation existing societal biases. In 2015, Amazon scrapped a ML-based recruiting tool  because it was [deemed to discriminate against women when making recommendations](https://www.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK08G) for technical roles such as software engineering. The problem? It was trained on ten years of historical data, which reflected the fact that software engineering has historically been a majority-male field. It is important to note that gender was not explicitly reported in the data — but algorithms can pick up on patterns that serve as a proxy for gender, such as attendance at an all-women university. This is commonly referred to as **historical bias**.

### Stage 2 (Algorithm Training / Evaluation)

In Stage 2, an algorithm is trained on the collected data.  For each example in the data, the **features** are passed to the algorithm, and are used to try to predict which **label** is correct for that example. Then, the **error** (also known as **loss** or **cost**) is computed for the prediction, which is then used to help the algorithm be *less wrong* (and therefore *more right*) in the future. During this stage, the **performance** of the model is calculated. Here are some questions that should be considered at this stage:

- **How is performance being measured?** There are a number of metrics that are used to evaluate the performance of an algorithm. Each metric has strengths and weaknesses, and will be most useful under certain circumstances. The explanation of these metrics is beyond the scope of this post, but here are some of the most common ones, with links to further resources:
  - [Accuracy](https://developers.google.com/machine-learning/crash-course/classification/accuracy)
  - [Precision and Recall](https://developers.google.com/machine-learning/crash-course/classification/precision-and-recall)
  - [F1 Score](https://en.wikipedia.org/wiki/F-score)
  - [ROC/AUC](https://developers.google.com/machine-learning/crash-course/classification/roc-and-auc)

- **Are sub-groups being considered when evaluating the model?** Algorithms often show up in the news when they are found to perform poorly on a certain sub-groups. This is largely avoidable, by increasing the granularity of performance assessment. One important way to do this is to assess how the model performs for different sub-groups before the model is released. Errors stemming from this topic are commonly known as **evaluation biases**.

### Stage 3 (Application)

In Stage 3, the model is deployed in the real world, applied to new data to make predictions and aid in decision-making processes. Unexpected behavior can occur if there is a difference between the problem a model was trained to solve, and the situation in which the model is applied. (**Hint**: there is *always* a difference.) The important thing is to be aware of this gap, and to account for it. Here are some questions that should be considered at this stage:

- **Is the model creating a feedback loop?** Consider the [algorithms that are used for predictive policing](https://arxiv.org/pdf/1706.09847.pdf). These models use the quantity of arrests in a certain area as a proxy for crime levels. Based on this pattern, the models direct more police to the areas where more arrests have occurred. The increased police-presence leads to more arrests, which is then delivered as feedback to the model, suggesting that even more police should be sent. This creates a [self-reinforcing feedback loop](https://en.wikipedia.org/wiki/Positive_feedback), as the output of the model's predictions are controlling the input it will receive in the future. These types of feedback loops can be very difficult to resolve once they are unleashed.
  
- **Is a model built on *correlation* being used to predict *causation*?** Consider this common example: ice cream consumption is very highly correlated with death by drowning. Does that mean that eating ice cream causes death by drowning? Of course not — both trends are driven by another factor, hot weather, which sends humans to both the ice cream stand and the swimming pool at a higher rate. This is easy for us to grasp — however algorithms do not possess the same common-sense that allows humans to spot this as a pattern of correlation, and not causation.

# Conclusion

In this post, I covered a brief introduction to bias in machine learning, and outlined some of the ways that bias can creep in during the machine learning lifecycle. In future blog posts, I plan to cover the following topics through the process of building and refining a machine learning model:

- How to go about mitigating algorithmic bias, once a potential problem is detected.
- How to build hybrid systems, with 'humans in the loop', to monitor models over time.
- How to implement automated model monitoring tools, such as AWS's [SageMaker Model Monitor](https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html).

Stay tuned!