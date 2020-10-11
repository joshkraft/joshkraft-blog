---

title: "A Roadmap for Passing the AWS Machine Learning Specialty Certification"
description: "Reccomended resources for passing for the AWS Machine Learning Specialty."
layout: post
toc: false
comments: true
image: ../images/blog_posts/AWS_Machine_Learning_Certification_Roadmap/AWS-Certified_Machine-Learning_Specialty_512x512.6ac490d15fe033a3d67ca544ecd0bcbcb10d391a.png
hide: false
search_exclude: true
categories: [AWS, Machine Learning]
---

## Overview

I recently passed the [**AWS Certified Machine Learning - Specialty**](https://aws.amazon.com/certification/certified-machine-learning-specialty/) exam. Given the relative newness of this exam (released in March 2019), I found it difficult to come across quality resources around what sort of topics are tested on the exam, as well as the depth to which each topic is covered. In this post, I hope to provide a road-map for others that are studying for this exam. 

On the [**certification homepage**](https://aws.amazon.com/certification/certified-machine-learning-specialty/), AWS gives the following description of the exam:

> *The AWS Certified Machine Learning - Specialty certification is intended for individuals who perform a development or data science role. It validates a candidate's ability to design, implement, deploy, and maintain machine learning (ML) solutions for given business problems.*

AWS reccomends '1-2 years of experience developing, architecting, or running ML/deep learning workloads on the AWS Cloud' before attempting this exam. However, many people that are interested in this certification do not have 1-2 years of experience deploying ML on AWS, and are pursuing this certification in order to gain such experience. How should they proceed?

After passing this exam myself, I believe the best way to approach this certification is through an indirect approach, starting with Python and ML before delving into the AWS side of things:

1. Become proficient(ish) in Python.
2. Study ML until you can explain the core concepts/algorithms to a friend.
3. Learn the AWS services/algorithms relevant to this exam.
4. Read up on Machine Learning Engineering concepts.
5. Take the AWS practice exam. If it goes well, take the real exam.

Most of these resources are free. Paid resources will be denoted by a dollar sign ($).

------

## 1. Become proficient(ish) in Python.

The first thing to note about this exam is that ~50% of the questions are about ML concepts, with no AWS crossover. Speaking broadly, the two ways to build understanding of ML concepts is through reading mathematical formulas (theory), or implementations in code (application). 

For the vast majority of people looking to enter the field of ML, learning to code (and read code) first is a great option, as it will allow you to start experimenting with the material on your own. Then, you can pick up on the math as it becomes necessary along the way.

Currently, Python is the go-to language for most machine learning practitioners and libraries, so the resources that you come across when studying ML will likely be written in Python. Luckily, Python has a relatively short learning curve, and can be used to do just about anything.

When you feel comfortable with the basics of Python, go ahead and move on to the next section. If you start working on the ML resources below and feel held back by your lack of Python experience, you can always return to this section for a few more days/weeks/months. 

>**Note:** You will not see any code on the exam. This is not a required prerequisite. However, the exam expects a deep understanding of ML concepts, and being able to read/write code in Python is the fastest way for most people to build that intuition.

### Reccomended Python Resources

[**Kaggle Python Course**](https://www.kaggle.com/learn/python)

Taught by [Colin Morris](https://www.kaggle.com/colinmorris), this course provides a great fast-paced, interactive introduction to Python. Everything is completed in the browser, so there is no need to even install Python on your computer to get started.

[**Learn Python the Hard Way ($)**](https://learncodethehardway.org/python/)

This course provides a better starting point for those with absolutely no programming experience, and focuses on fundamentals and repitition before moving on to more advanced topics.

------

## 2. Study ML until you can explain the core concepts/algorithms to a friend.

Once you are comfortable with the basics of Python, it is time to move on to the main focus of the exam: machine learning. In particular, the exam has a heavy focus on tuning and debugging deep neural networks. The material covered in this step makes up about 50% of the exam, and can be unintuitive at first for those with no background in math or statistics. 

However, the concepts all build on each other, and the more time you spend experimenting the easier it will be to understand the material. Many of the resources in this section have a lot of overlap, and that is intentional. I find that the 'light-bulb' moments happen most often when you engage with the material in a few different ways. 

### Reccomended Machine Learning Resources

[**Machine Learning Guide (Podcast)**](http://ocdevel.com/mlg)

I found this podcast to be a phenomenal introduction to the field of ML, and the creator is very intentional about keeping sight of the *forest for the trees*, providing context for how all the different pieces of ML go together. The podcast starts at the very basics of the field, with topics like Linear and Logistic Regression, which are crucial algorithms to understand before jumping off into the deep end of ML algorithms.

[**Practical Deep Learning for Coders by FastAI (Course/Book)**](https://www.fast.ai)

I am a huge fan of everything FastAI puts out, and I found the latest version of their *Practical Deep Learning for Coders* course to be both deeply informative and motivating. This course is obsessively focused on practical applications of Deep Learning. From the course website:

> We teach almost everything through real examples. As we build out those examples, we go deeper and deeper, and we'll show you how to make your projects better and better. This means that you'll be gradually learning all the theoretical foundations you need, in context, in such a way that you'll see why it matters and how it works.

This course leaves you with a good understanding of what Deep Learning is, why it has become so powerful in recent years, and how to apply concepts like [transfer learning](https://en.wikipedia.org/wiki/Transfer_learning) to achieve state of the art results in areas like computer vision. I recommend taking your time with this course - the more you put in, the more you will get out.

[**Deep Learning with Python (Book) ($)**](https://www.amazon.com/Deep-Learning-Python-Francois-Chollet/dp/1617294438)

Another resource I found useful was François Chollet's *Deep Learning with Python* book. This book takes a similar approach to the FastAI course, focusing on practical application and examples over everything else. Chollet does a great job of using simple Python code snippets (instead of formulas) to explain the core mathematical concepts underlying modern neural network architectures.

[**Neural Networks from Scratch (Book) ($)**](https://nnfs.io)

At this point, you should have a solid foundational understanding of the basics of ML, and a reasonable understanding of modern deep learning architectures. In order to truly drill in your understanding of fundamental concepts such as the utility of activation functions, gradient descent, and backpropagation, you may find it useful to code a neural network from scratch. 

In this book (which is still in draft form as of October 2020), [Harrison Kinsley](https://github.com/Sentdex) guides you through the construction of a neural network in pure Python, starting from a single neuron and building up from there. 

### Other Interesting ML Resources

The above resources are more than sufficient to build enough understanding of ML in order to pass this certification. However, I found the following materials to be interesting when studying ML:

[**Lex Fridman Podcast**](https://lexfridman.com/podcast/)

Lex Fridman is an AI researcher based at MIT. His podcast is an interview-based exploration of cutting edge topics in ML, robotics, software, and more.

[**Applied Data Ethics by FastAI (Course)**](https://ethics.fast.ai/syllabus/index.html)

This course is another FastAI offering, covering a broad range of ethical issues relating to data and ML. The main focus points are disinformation, bias, fairness, and privacy. I think this is a great set of topics to keep in mind as you delve into the world of ML.

[**3Blue1Brown Neural Network (Video Series)**](https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi)

This series of videos, produced by [Grant Sanderson](https://www.3blue1brown.com/about) at 3blue1brown, provides a phenomenal visualization of what is happening 'behind the scenes' when a neural network is *learning*. I watched this series a few times throughout my studying, and gained more understanding each time I watched them through.

------

## 3. Learn the AWS services/algorithms relevant to this exam.

The other 50% of the exam covers the AWS services relevant to training, tuning, debugging, and deploying models in the AWS cloud. 

> **Note**: At the time of this writing, AWS offers a 50% discount on a future certification exam after passing any of the AWS certifications. As such, it may make sense to actually take one of the entry level AWS exams first (such as Cloud Practitioner, which costs $100), in order to learn the fundamental AWS services. Assuming you pass that exam, you can then use the 50% discount to sign up for the Machine Learning Specialty exam. All in, you would spend $250 for 2 certifications, rather than $300 for 1 certification.

### Reccomended AWS Resources

[**AWS Certified Machine Learning Specialty 2020 - Hands On! (Course) ($)**](https://www.udemy.com/course/aws-machine-learning/)

This course provides a good overview of the breadth of AWS knowledge you need to pass this certification exam. However, this course is best used as a *syllabus* for your AWS studying. You will likely need to spend lots of time studying the material covered in each section of the course in the actual AWS documentation, as the course covers everything at a pretty broad level.

[**AWS SageMaker Developer Guide (Documentation) **](https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html)

This site is an exhaustive look at each component of SageMaker, which is the main AWS service tested in this exam. While I would not reccomend reading all of the documentation from start to finish, I would reccomend saving this site and referring to it often.

[**AWS SageMaker Examples (Github Repo) **](https://github.com/aws/amazon-sagemaker-examples)

This repository of example notebooks is a phenomenal resource for getting hands-on with SageMaker, and tinkering with the built-in algorithms that you will need to know for the test.

------

## 4. Read up on Machine Learning Engineering concepts.

To tie everything together, I would strongly reccomend reading the [**Machine Learning Engineering book**](http://www.mlebook.com/wiki/doku.php) by [Andriy Burkov](https://twitter.com/burkov). This book is an incredible resource for learning about the stumbling blocks of deploying ML systems at scale, in production. **These concepts are tested heavily on the exam**, and are not easy to learn without industry experience. The book is distriuted on the 'read-first, buy-layer' principle, so you are free to read the book and only purchase if you find it to be useful.

------

## 5. Take the AWS practice exam. If it goes well, take the real exam.

At this point, you should be ready to take (and pass) the AWS Machine Learning - Specialty certification. Since unofficial practice exams are so hard to come by for this exam, I would reccomend shelling out the $40 USD to take the official AWS practice exam.

> **Note**: If you have passed an AWS certification in the past, you should have recieved a coupon for 1 free practice exam in your email Inbox.

I found that my performance on the practice exam was a good proxy for my performance on the real exam, so if you pass the practice exam, I would reccomend going ahead and signing up for the real thing. 

Feel free to reach out with any further questions about this exam!