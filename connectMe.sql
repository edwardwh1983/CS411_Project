/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS ConnectMe;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE ConnectMe;


USE ConnectMe;

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE Company
(
     Name NVARCHAR(50) NOT NULL,
     Content NVARCHAR(1000),
     Headquarter NVARCHAR(200),
     Website NVARCHAR(100),
     Industry NVARCHAR(50),
     Founded INT, 
     PRIMARY KEY(Name)

);

CREATE TABLE Job
(
     ID  INT NOT NULL,
     Company NVARCHAR(50) NOT NULL,
     Description  NVARCHAR(5000),
     FIELD NVARCHAR(50),
     MinimumDegree NVARCHAR(50),
     Location NVARCHAR(10),
     Link NVARCHAR(100),
     PRIMARY KEY(ID) 
);

CREATE TABLE Skillset
(
     Skill NVARCHAR(50),
     PRIMARY KEY(Skill)
);

CREATE TABLE HaveSkill
(
     NetID NVARCHAR(40) NOT NULL,
     Skill NVARCHAR(50)
);

CREATE TABLE User 
( 
     NetID NVARCHAR(40) NOT NULL, 
     FirstName NVARCHAR(40),
     LastName NVARCHAR(40),
     Phone  NVARCHAR(24),
     Email NVARCHAR(100),
     Major NVARCHAR(50),
     Address NVARCHAR(100),
     City NVARCHAR(50),
     State NVARCHAR(10),
     Password NVARCHAR(50),
     PRIMARY KEY(NetID)
);

CREATE TABLE RequireSkill
(
     JobID INT,
     Skill NVARCHAR(50)
);

CREATE TABLE InterviewQuestion
(
     Company NVARCHAR(50) NOT NULL,
     Question NVARCHAR(1000)
);

CREATE TABLE Admin
(   
    NetID NVARCHAR(40) NOT NULL,
    Password NVARCHAR(50)
);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO Company VALUES (N'Apple', N'Apple reinvented the mobile phone with its revolutionary iPhone and App Store, defined the future of mobile media and computing devices with iPad and has announced Apple Watch, its most personal device ever.<br>Apple has an \"i\" for revolutionary technology. Since release, the company\'s iPhone -- which accounts for the largest portion of its sales -- has spurred a revolution in cell phones and mobile computing. Apple also continues to innovate its core Mac desktop and laptop computers, all of which feature its OS X operating system, including the iMac all-in-one desktop for the consumer and education markets, the MacBook Air ultra-portable laptop, and the high-end Mac Pro and MacBook Pro for consumers and professionals. The company\'s popular iPad tablet computer has become another game-changer in the consumer market. It generates nearly two-thirds of sales outside the US.', N'1 Infinite Loop Cupertino, CA 95014 United States', N'http://www.apple.com/', N'Consumer Electronics', 1976);
INSERT INTO Company VALUES (N'Google', N'Google\’s mission is to organize the world\‘s information and make it universally accessible and useful.<br>If you don\'t know what the term Google means, there\'s a leading Internet search engine you can use to find out. Taking its name from \"googol\" -- the mathematical term for the value represented by a one followed by 100 zeros -- Google offers targeted search results from billions of Web pages. Results are based on a proprietary algorithm; its technology for ranking Web pages is called PageRank. The firm generates revenue through ad sales. Advertisers deliver relevant ads targeted to search queries or Web content. The Google Network is a network of third-party customers that use Google\'s ad programs to deliver relevant ads to their own sites.', N'1600 Amphitheatre Parkway Mountain View, CA 94043 United States', N'http://wwww.google.com/', N'Internet', 1998);
INSERT INTO Company VALUES (N'Facebook', N'Founded in 2004, Facebook’s mission is to make the world more open and connected. <br> When it comes to social networking, it\'s wise to put your best face forward. Facebook, the social networking juggernaut, lets users share information, post photos and videos, play games, and otherwise connect with one another through online profiles. The site, which allows outside developers to build apps that integrate with Facebook, boasts more than a billion total users. The firm was launched in 2004 by Harvard student Mark Zuckerberg as an online version of the Harvard Facebook. (The name comes from books of freshmen\'s faces, majors, and hometowns that are distributed to students.) In 2012 Facebook began publicly trading after filing one of the largest IPOs in US history.', N'1 Hacker Way Menlo Park, CA 94025 United States', N'http://www.facebook.com/', N'Internet', 2004);
INSERT INTO Company VALUES (N'LinkedIn', N'Founded in 2003, LinkedIn connects the world’s professionals to make them more productive and successful.<br>Feeling a bit disconnected to the business world? LinkedIn wants to help. The firm operates an online professional network designed to help members find jobs, connect with other professionals, and locate business opportunities. The site has grown to reach more than 340 million users in some 200 countries since its launch in 2003. LinkedIn is free to join; it offers a paid premium membership with additional tools and sells advertising. It additionally earns revenue through its job listing service, which allows companies to post job openings and search for candidates on LinkedIn.', N'2029 Stierlin Court Mountain View, CA 94043 United States', N'https://www.linkedin.com/', N'Internet', 2003);
INSERT INTO Company VALUES (N'Microsoft', N'At Microsoft we create technologies and develop products that touch just about every kind of customer.<br>Microsoft\'s ambitions are anything but small. The world\'s #1 software company develops and sells a variety of products used by consumers and businesses. Its core products are the ubiquitous Windows PC operating system and the Office business productivity application suite that are sold in part through PC makers such as Acer, Lenovo, Dell, Hewlett-Packard, and Toshiba, who pre-install the software on devices. Microsoft also sells directly online and through resellers. Other products include enterprise applications (Microsoft Dynamics), server and storage software, and video game consoles (Xbox). It also makes mobile phone software. Microsoft has acquired Nokia\'s handset business.', N'1 Microsoft Way Redmond, WA 98052 United States', N'http://www.microsoft.com/', N'Computer Software', 1975);
INSERT INTO Company VALUES (N'Amazon', N'Amazon strives to be Earth’s most customercentric company where people can find and discover virtually anything they want to buy online.<br>What began as Earth\'s biggest bookstore has become Earth\'s biggest everything store. Expansion has propelled Amazon.com in innumerable directions. While the website still offers millions of books, movies, games, and music, selling other items -- such as electronics, apparel and accessories, auto parts, home furnishings, health and beauty aids, toys, and groceries -- contributes some two-thirds of sales. Shoppers can also download e-books, games, MP3s, and films to their computers or handheld devices, including Amazon\'s own portable e-reader, the Kindle. Amazon also offers products and services, such as self-publishing, online advertising, e-commerce platform, hosting, and a co-branded credit card.', N'123 Boren Seattle, WA 98109 United States', N'http://www.amazon.com', N'Internet', 1994);
INSERT INTO Company VALUES (N'Intel', N'Intel has followed the law -- Moore’s Law, that is -- to the top spot in manufacturing and selling semiconductors. Company co-founder Gordon Moore determined in the 1960s that microprocessors would regularly get more powerful, smaller, and less expensive. Intel has followed that formula to grab about 80% of the market share for microprocessors that go into desktop and notebook computers, smartphones, tablets, and computer servers. The company also makes embedded semiconductors for the industrial, medical, and in-vehicle infotainment markets. The company’s technology roadmap calls for releasing a new Core processor and a Xeon processor every two years. Most computer makers use Intel processors.', N'2200 Mission College Blvd<br>Santa Clara, CA, 95054 United States', N'http://www.intel.com', N'Semiconductor', 1968);
INSERT INTO Company VALUES (N'HP', N'Hewlett-Packard is slimming down to flex its muscle in big data, cloud computing, and security. HP provides one of the tech world\'s most comprehensive portfolios of hardware, software, and services. It is the world’s second-largest provider of PCs ( Lenovo is #1); other products include servers, storage devices, printers, and networking equipment. The company’s services unit offers IT and business process outsourcing, application development, consulting, systems integration, and other technology services. HP generates software sales through enterprise IT management, big data, and security applications. The 75-year-old company, which serves customers worldwide, in 2014 announced plans to split into two companies, taking its restructuring to the ultimate level.', N'3000 Hanover St.<br>Palo Alto, CA, 94304 United States', N'http://www.hp.com', N'PC', 1939);
INSERT INTO Company VALUES (N'IBM', N'International Business Machines (IBM) is the world\'s top provider of computer products and services. Called Big Blue for a reason, the company is among the leaders in almost every market in which it competes. It focuses primarily on its services business, which accounts for nearly 60% of sales. While IBM made its name in computer hardware (think mainframes), the company\'s information technology, business services, and software units are now among the largest in the world. While it has moved from hardware to a large degree, the company maintains its industry-leading enterprise server and data storage products lines. IBM is transforming its operations as it deals with a rapidly changing technology environment.', N'1 New Orchard Rd<br>Armonk, NY, 10504 United States', N'http://www.ibm.com', N'Computing services', 1911);
INSERT INTO Company VALUES (N'DELL', N'Dell\'s name rings from the desktop to the data center. The world\'s #3 supplier of PCs (behind #1 Lenovo and #2  Hewlett-Packard) Dell provides a broad range of technology products for the consumer, education, enterprise, and government sectors. In addition to its line of desktop and notebook PCs, Dell offers network servers, data storage systems, printers, Ethernet switches, and peripherals, such as displays and projectors. It also markets third-party software and hardware. The company\'s services unit provides asset recovery, financing, infrastructure consulting, support, systems integration, and training, as well as hosted IT services. Dell was taken private in 2013 in a deal valued at nearly $25 billion.', N'1 Dell Way<br>Round Rock, TX, 78682 United States', N'http://www.dell.com', N'PC', 1984);
INSERT INTO Company VALUES (N'ORACLE', N'Oracle can’t foretell the future, but it helps its customers better manage their way into the future by supporting their business operations.  The leader in enterprise software (about 76% of its sales), it also provides hardware and services to help companies improve their processes. Best known for its focus on databases, it offers aid in areas such as managing business data, collaboration and application development, customer relationship management, and supply chain management. In recent years the company has aggressively used acquisitions to expand, such as its entry into the hardware business with the purchase of Sun Microsystems.', N'500 Oracle Pkwy<br>Redwood City, CA, 94065 United States', N'http://www.oracle.com', N'Computer Software', 1977);
INSERT INTO Company VALUES (N'Symantec', N'Symantec\'s future seems to be secure. The company provides security, storage, and systems management software for businesses and consumers. Symantec\'s applications handle such functions as virus protection, PC maintenance, data backup and recovery, intrusion detection, data loss prevention, spam control, content filtering, and remote server management. The company also provides managed services and training. Symantec is probably best known for its popular Norton family of consumer security software, which the company markets to PC users worldwide. In 2014, the company announced it would split into two companies. One will develop and sell security products and the other will focus on information management products.', N'350 Ellis St<br>Mountain View, CA, 94043 United States', N'http://www.symantec.com', N'Computer Software', 1982);
INSERT INTO Company VALUES (N'VMware', N'VMware serves a virtually global clientele. The company develops software used to create and manage virtual machines -- computer functions spread across multiple systems that act as one. Companies use its applications to more efficiently integrate and manage server, storage, and networking functions, to lower the cost of operating their IT systems. VMware also provides an extensive range of consulting, technical support, training, and certification services that accounts for just over half of sales. The company has marketing relationships with top computer hardware vendors, including Dell, Hewlett-Packard, and Cisco. Data storage systems maker EMC holds a controlling stake in VMware.', N'3401 Hillview Ave<br>Palo Alto, CA, 94304 United States', N'http://www.vmware.com', N'Computer Software', 1998);
INSERT INTO Company VALUES (N'Fiserv', N'Fiserv gives financial companies the tech services they need to run. The company provides core processing systems, electronic billing and payment systems, ATM management, and loan processing services to banks, thrifts, credit unions, and other financial institutions. It also provides licensed software, consulting, and other support services to round out its offerings. Fiserv serves customers of all sizes, but its bread and butter has traditionally been small to midsized banks without in-house processing units. Other clients include insurance companies, merchants, leasing firms, and government agencies. Founded in 1984, Fiserv serves some 14,500 clients in 100-plus countries.', N'255 Fiserv Dr<br>Brookfield, WI, 53045 United States', N'http://www.fiserv.com', N'Computer Software', 1984);
INSERT INTO Company VALUES (N'Intuit', N'Intuit knows that good accounting takes more than a pocket calculator. The company is a leading developer of software used to manage personal finances and budgeting (Quicken, Mint), small business accounting (QuickBooks), and consumer tax preparation (TurboTax). Customers include individual consumers, accountants, and small businesses; Intuit claims more than 45 million users for its products and services. Other offerings include payroll and payment software for small businesses, financial supplies (paper checks, invoices, deposit slips), and online marketing and communications products. It generates most of its sales in the US.', N'2632 Marine Way<br>Mountain View, CA, 94043 United States', N'http://www.intuit.com', N'Computer Software', 1983);
INSERT INTO Company VALUES (N'Salesforce.com', N'Salesforce.com champions the power of the social enterprise. The company offers Internet-based applications that manage employee collaboration as well as customer information for sales (Salesforce Sales Cloud), marketing (Salesforce Marketing Cloud), and customer support (Salesforce Service Cloud), providing clients with a rapidly deployable alternative to traditional, more time-consuming and user-maintained software installations. Salesforce.com counts more than 100,000 customers for its customer relationship management (CRM) software, and its customers come from a variety of industries, including financial services, telecommunications, manufacturing, and entertainment. It generates most of its revenues from the US.', N'1 Market Ste 300<br>San Francisco, CA, 94105 United States', N'http://www.salesforce.com', N'Cloud Computing', 1999);
INSERT INTO Company VALUES (N'eBay', N'\"I got it on eBay\" has barreled its way into the lexicon of the new millennium, placing a cyber-grin on the corporate face of this online auctioneer. Trading about $2,000 worth of goods every second, eBay offers an online forum for selling merchandise worldwide, from fine antiques to the latest video games. eBay generates revenue through listing and selling fees and through advertising, and boasts more than 120 million users. Its online payments assets consist of PayPal and Bill Me Later; other e-commerce platforms include StubHub and Half.com. eBay also has a mobile version of its service, and owns e-commerce services provider GSI Commerce, as well as a minority stake in online classifieds service craigslist.', N'2065 Hamilton Ave<br>San Jose, CA, 95125 United States', N'http://www.ebay.com', N'E-commerce', 1995);
INSERT INTO Company VALUES (N'Yahoo!', N'Yahoo! wants to spread some cheer to Internet users around the world. Its network of websites offers news, entertainment, and shopping, as well as search results powered by Microsoft\'s Bing. Yahoo! generates most of its revenue through providing search and display advertising to Web operations in three categories: Communications & Communities (including Yahoo! Mail, Yahoo! Groups, and Flickr), Search and Marketplaces (Yahoo! Search), and Media (Yahoo! Homepage, Yahoo! Finance). Other revenues come from fee-based services such as premium e-mail; royalties, licenses, and mobile products; and broadband Internet access.', N'701 First Ave<br>Sunnyvale, CA, 94089 United States', N'http://www.yahoo.com', N'Web Portal', 1995);
INSERT INTO Company VALUES (N'Twitter', N'The whole world is following this company. Twitter operates a free digital service site that blends social networking with the ability to post short messages (or micro-blogs) limited to 140 characters or less, commonly known by users as \"Tweets.\" Twitter\'s service works equally well on personal computers, mobile devices, and smartphones. The service has become a key communication platform as major events unfold live in real-time around the world. Currently Twitter claims more than 230 million users worldwide. Evan Williams, Jack Dorsey, and Biz Stone co-founded Twitter in 2006. In 2013 the fast-growing company went public, raising $1.82 billion in the process.', N'1355 Market St Ste 900<br>San Francisco, CA, 94103 United States', N'http://twitter.com', N'Social', 2006);

INSERT INTO Job VALUES (3, N'Google', N'Life on the web moves fast, and our millions of users around the world expect nothing less from us. Which is why Google is passionate about developing and releasing software rapidly. As a Software Engineer in Test (SET), your mission is to build the tools and infrastructure to increase our developers\' efficiency. You play a crucial part in Google\'s success by partnering with the software developers to ensure that our code is thoroughly tested to the highest standards. In doing so, you help us secure our business future by creating the next generation of tools and frameworks that make our users and developers more productive.
<br>As a Software Engineer in Test, you have the opportunity to accelerate the delivery and to improve the quality of Google products. You will be responsible for designing and implementing development and test infrastructure. You will be part of an Engineering team that is working on problems in a number of areas, including caching optimizations, content delivery, network protocols, machine learning, and mobile products. Your focus is developing code rather than fixing or finding bugs. Your job is to accelerate product development by helping developers help themselves. 
<br>You will typically work in teams that collaborate on common problems across products and across focus areas. As a result, you will have exposure to a broader set of problems, which allows for career growth and proximity to abundant technical problems. 
<br>Google Software Engineers in Test are focused on the hardest, most interesting aspects of delivering high quality software.
<br><br><b>Responsibilities</b>
<br>Build advanced automated test suites to exercise our world-class applications.
<br>Work with the development and test engineering teams to automate testing.
<br>Conduct research on emerging technologies.
<br>Analyze and decompose a complicated software system and design a strategy to test this system.
<br><br><b>Minimum qualifications</b>
<br>BS in Computer Science or related technical field or equivalent practical experience.
<br>Relevant internship or work experience, including development and/or test automation experience.
<br><br><b>Preferred qualifications</b>
<br>Master\'s or PhD in Computer Science or related technical field.
<br>Extensive knowledge of Unix/Linux environments.
<br>Deep knowledge of internet technologies.
<br>Excellent coding skills in C, C++, Java, or Python.
<br>Scripting skills in Python, Perl, Shell or another common language.
<br><br><b>Area</b>
<br>Google is and always will be an engineering company. We hire people with a broad set of technical skills who are ready to tackle some of technology\'s greatest challenges and make an impact on millions, if not billions, of users. At Google, engineers not only revolutionize search, they routinely work on massive scalability and storage solutions, large-scale applications and entirely new platforms for developers around the world. From AdWords to Chrome, Android to YouTube, Social to Local, Google engineers are changing the world one technological achievement after another.
<br><br><b>Software Engineering</b> 
<br>Develop the next-generation technologies that change how millions interact.
<br>Learn more about our Software Engineering roles 
<br>Mountain View (Global HQ) 
<br>Want to stop talking about changing the world and actually do it? At Google Mountain View, our global headquarters, we make products for hundreds of millions of users around the world that change the ways they create, share, communicate, collaborate and do business.
<br><br>Learn more about our Mountain View global headquarters', 
N'Software Engineer in Test', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/12148409?trk=jserp_job_details_text');
INSERT INTO Job VALUES (1, N'Apple', N'Join our (WiSE) Wireless Software Engineering team that is revolutionizing the watch! As a software engineer in test on the Apple Watch team, you will be responsible for shipping the most accurate and precise time piece. You will help build tests, test applications and analysis tools for the brand new WatchOS platform. You’ll work closely with the UI, GPS, BT/WIFi teams to keep the accuracy of the watch to ±50ms in both the system and the UI layer, that will be shipped to millions of users.
<br><br><b>Key Qualifications</b>
<br>Strong analytical skills
<br>Background of location technology / bluetooth / networking
<br>Good programming / scripting / data analysis skills
<br>Great team player with good communication skills
<br>In depth understanding of networking protocols (NTP/UDP/TCP)
<br>Fluent in at least one or more of the languages (Python/Objective-C/Swift).
<br>Thrive in a collaborative environment and can clearly communicate while confidently driving multiple projects across many teams
<br>Obsessively passionate and inquisitive, and seek to solve everyday problems in innovative ways
<br>Laser-focused on the smallest details that are meaningful to our customers
<br><br><b>Description</b>
<br>In this position, you will join a dynamic team responsible for qualifying the next generation of iOS Location/Motion/Time features while collaborating with various cross functional teams. You will be involved in design, development and execution of new test scenarios, bug reporting and troubleshooting as well as developing innovative automation tools.
<br><br><b>Education</b>
<br>Bachelors Degree in Computer Science, Computer Engineering, Electrical Engineering, or equivalent experience', 
N'Software Engineer', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/40024386?trk=jserp_job_details_text');
INSERT INTO Job VALUES (2, N'Apple', N'Imagine what you could do here. At Apple, great ideas have a way of becoming great products, services, and customer experiences very quickly. Bring passion and dedication to your job and there\'s no telling what you could accomplish.
<br><br><b>Key Qualifications</b>
<br>Minimum of 5 years of directly related experience.
<br>Required skills include C, C , x86/PowerPC, DRM, Mac/Windows APIs.
<br><br><b>Description</b>
<br>Apple Computer is looking for a Software Engineer for Apple Pay security. Must possess strong interest in the area of payment , cryptography. Must have a strong understanding of consumer expectations and behaviors in this space. Multiple platform experience is highly desired. Communication skills required to interface with other groups within and outside the company.
<br><br><b>Education</b>
<br>M.S. or PhD in Computer Science or related degree.', 
N'Software Engineer', N'MS', N'CA', N'https://www.linkedin.com/jobs2/view/38622840?trk=jserp_job_details_text');
INSERT INTO Job VALUES (4, N'Google', N'Machine Intelligence is a high impact team within Knowledge that’s building the next generation of intelligence and language understanding for all Google products. To achieve this, we’re working on confidential projects that utilize the latest techniques in Artificial Intelligence, Machine Learning (including Deep Learning approaches like Google Brain) and Natural Language Processing. We impact products across Google including Search, Maps and Google Now.
<br>We’ve already been joined by some of the best and the brightest minds in AI, and we’re looking for talented software engineers that have applied experience in the fields of Machine Learning and Artificial Intelligence to join our team. 
<br>As a software engineer in Machine Intelligence, you work on a small team, collaborating closely with other product teams and you’re able to switch projects as our fast-paced business grows and evolves. We need our engineers to be versatile and passionate to tackle new problems. Because you’ll be working with cutting-edge technology, you’ll also get a chance to work closely with researchers across Google.
<br><br><b>Responsibilities</b>
<br>Participate in cutting edge research in artificial intelligence and machine learning applications.
<br>Develop solutions for real world, large scale problems.
<br><br><b>Minimum Qualifications</b>
<br>BA/BS in Computer Science, related technical field or equivalent practical experience.
<br><br><b>Preferred Qualifications</b>
<br>MS or PhD degree in Computer Science, Artificial Intelligence, Machine Learning, or related technical field.
<br>Strong background in Natural Language Processing or Computer Vision.
<br>Experience coding in C, C++, Java, or Python.
<br>Strong background in Machine Learning or Artificial Intelligence.',
N'Machine Learning', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/12966884?trk=jserp_job_details_text');
INSERT INTO Job VALUES (5, N'Facebook', N'Facebook was built to help people connect and share, and over the last decade our tools have played a critical part in changing how people around the world communicate with one another. With over a billion people using the service and more than fifty offices around the globe, a career at Facebook offers countless ways to make an impact in a fast growing organization.
<br>Nearly 1.4 billion people use Facebook each month to connect with friends, family, and public figures. A big part of this social connection is the ongoing social conversation that takes place on Facebook about the latest breaking news, award show, and sporting event being watched all around the world. As a data analyst on the consumer communications team, your primary focus will be on using data to bring these big public moments to life, particularly in relation to important sporting events and breaking news about notable athletes. This position is full-time and based in Menlo Park. 
<br><br><b>Responsibilities</b>
<br>Conduct in-depth research on Facebook usage and engagement
<br>Partner with internal groups (FBIQ, Media Research, Data Science) to support the data needs of various consumer PR projects
<br>Build and maintain an archive of key research findings, and develop benchmarking capabilities and innovative new ways of telling interesting data stories
<br>Work with visualization peers to bring key data patterns to life
<br>Surface relevant third-party research to key partner teams within PR/Comms
<br><br><b>Requirements</b> 
<br>2+ years of data related working experience
<br>Advanced degree in psychology, statistics, economics, behavioral or social science or a related quantitative field
<br>Outstanding statistical and data analysis skills using SQL or similar (HIVE experience a plus)
<br>Experience visualizing large and diverse data sets
<br>Track record of operating independently, demonstrating creativity, being detail-oriented, and delivering results in a highly organized manner
<br>Excellent oral and written communication skills
<br><br>As part of our dedication to the diversity of our workforce, Facebook is committed to Equal Employment Opportunity without regard for race, ethnicity, gender, protected veteran status, disability, sexual orientation, gender identity or religion.', 
    N'Data Analyst', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/40865562?trk=jserp_job_details_text');
INSERT INTO Job VALUES (6, N'Facebook', N'Facebook was built to help people connect and share, and over the last decade our tools have played a critical part in changing how people around the world communicate with one another. With over a billion people using the service and more than fifty offices around the globe, a career at Facebook offers countless ways to make an impact in a fast growing organization.
<br>Systems Engineers on the Hardware Engineering team are responsible for a wide range of tools, automation, provisioning, and control plane technology. This technology is used to bring up, deploy, and operate Facebook’s custom hardware platform worldwide. The team works closely with hardware engineers to define and develop our new designs, and regularly works with next-generation hardware technology months or years ahead of release. 
<br><br>Our team is comprised of varying levels of experience and backgrounds, from new grads to industry veterans. Relevant industry experience is important, but ultimately less so than your demonstrated abilities and attitude. We sail into uncharted waters every day at Facebook, and we are always learning.
<br><br>This position is full-time and located in our Menlo Park office. 
<br><br><b>Responsibilities</b>
<br>Enable the development of new hardware technology and server designs on rapid timelines
<br>Write and review code, hack new ways to solve complex hardware challenges, automate and instrument systems operating at tremendous scale, and debug complex hardware issues in our production fleet
<br>Together with the hardware engineering teams, you will share an on-call rotation and be an escalation contact for large-scale issues with our hardware fleet
<br>Partnered alongside the best engineers in the industry on the coolest stuff around, the code and systems you work on will be in production and used by millions of users all around the world
<br><br><b>Requirements</b> 
<br>BS in Computer Science, Engineering, or a related technical discipline preferred
<br>Extremely sound knowledge of Linux on x86 and ARM hardware
<br>Ability to code really well in at least one of the following languages: Python, PHP, Ruby, Perl, C, C++ or Java
<br>Ability to rapidly learn new development languages (Python and C are in heavy use on this team)
<br>Ability to pick up new software, frameworks and APIs quickly
<br>Sharp and tenacious troubleshooting skills: you can fix anything
<br>Solid understanding of server architecture, including at least one of the following: boot process, PCI, Ethernet, SMP/NUMA, I/O subsystems, and storage technology
<br>Good knowledge of basic large-scale internet service architectures (such as load balancing, LAMP, CDN\'s), even if you haven\'t worked on one
<br>Configuration and maintenance of common tools and applications such as kickstart, IPMI, DHCP/TFTP, NFS, NTP, SSH, DNS, and SNMP preferred
<br>A burning desire to "Move Fast and Be Bold"
<br>Good communications skills
<br>Detail oriented and able to execute careful changes to large fleets
<br><br>As part of our dedication to the diversity of our workforce, Facebook is committed to Equal Employment Opportunity without regard for race, ethnicity, gender, protected veteran status, disability, sexual orientation, gender identity or religion.', 
    N'Systems Engineer', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/22721695?trk=jserp_job_details_text');
INSERT INTO Job VALUES (7, N'Facebook', N'Facebook was built to help people connect and share, and over the last decade our tools have played a critical part in changing how people around the world communicate with one another. With over a billion people using the service and more than fifty offices around the globe, a career at Facebook offers countless ways to make an impact in a fast growing organization.
<br><br>“The Hacker Way” is an approach to building that involves continuous improvement and iteration. Hackers believe that something can always be better, and that nothing is ever complete. They just have to go fix it – often in the face of people who say it’s impossible or are content with the status quo. If you fit this calling, Facebook wants you to join our NYC-based engineering team and help to develop scalable solutions to some of the most, if not the most, intricate engineering problems that impact the likeability (thumbs up!) of our 1 billion+ users. 
<br><br>We’re looking for hardcore infrastructure engineers to join the Systems Engineering team. This infrastructure team builds the large, distributed systems that are the heart of Facebook, no easy task. Our code serves millions of requests per second, and it does so with sub-second latency and in a fault tolerant manner. We handle everything from distributed data storage, to synchronization and coordination of large server farms, to building a fast PHP virtual machine for our front end Facebook code. We are looking for candidates who posses a demonstrable, radiant energy towards tackling complexity and building platforms that can scale through multiple orders of magnitude to make the world more open and connected. 
<br><br><b>Responsibilities</b>
<br>Design core, backend software components that can scale as our product does
<br>Code using primarily C/C++, Java, PHP and Hack
<br>Interface with other teams to incorporate their innovations and vice versa
<br>Conduct design and code reviews
<br>Analyze and improve efficiency, scalability, and stability of various system resources
<br><br><b>Requirements</b> 
<br>B.S in Computer Science and 4+ years relevant experience
<br>4+ years experience building large-scale server applications
<br>5+ years experience developing and debugging in C/C++ or Java/C#
<br>2+ years experience with operating systems internals, file systems, programming language design, compilers also a plus
<br>Perl, PHP, Hack or Python a plus
<br><br>As part of our dedication to the diversity of our workforce, Facebook is committed to Equal Employment Opportunity without regard for race, ethnicity, gender, protected veteran status, disability, sexual orientation, gender identity or religion.', 
    N'Software Engineer', N'BS', N'NY', N'https://www.linkedin.com/jobs2/view/12688325?trk=jserp_job_details_text');
INSERT INTO Job VALUES (8, N'Microsoft', N'Microsoft IT is for those IT professionals and business technology professionals who want to be strategic partners to the business and be the first place to create innovative solutions using all of Microsoft’s products and services. Microsoft IT provides career growth opportunities, a rewarding and flexible work environment so you can better integrate professional and personal life. Unlike other IT organizations, Microsoft IT employees make global impact on thousands of customers and thousands of employees who use Microsoft software and services.
<br><br>The Enterprise Platforms and Services (EP&S) team is looking for a seasoned engineer to help design and implement our next generation Azure PaaS based Integration solution.
<br><br>We are developing Microsoft IT’s next generation integration platform based on the Microsoft Azure BizTalk PaaS service in Azure to enable integration between cloud, on-premises and hybrid applications. We are onboarding critical revenue business message streams for Microsoft. We are a key player in the Nokia integration in Microsoft. We have to onboard several hundred partners and their thousands of data streams within next 2 years.
<br><br>This effort is a fun challenge. We need to design in alignment with the principles of first and best, cloud first mobile first and lean towards configuration over customization. We are building this service to handle Microsoft’s large volume, critical financial transactions in a reliable, resilient and scalable way to meet strict compliance requirements and partners’ expectation. We are pioneering the adoption of Microsoft Azure BizTalk Services at a scale never done before and working hand in hand with the product team to improve the Azure and BizTalk Services product offering. We are expanding this service in three essential areas: creation of a standard pattern for B2B message flow satisfying Microsoft’s unique requirements, querying of message tracking DB to enable at-scale operations, and monitoring of the service in Azure and on-premises components through System Center.
<br>We have a fully staffed engineering team and are looking for a highly motivated Software Engineer II to help us execute on this effort. The role will primarily be one of implementation, testing and deployment, making big strides to onboard data streams with other engineers. This role will also require solid skills in and experience of software engineering best practices. This individual will leverage their knowledge and experience in Azure to help design and implement the components and layers that compose our integration service. This is an individual contributor role reporting to the software engineering lead.
<br><br><b>Basic Qualifications</b>
<br>- 4-5 years of demonstrated work experience
<br>- BS degree or higher in computer science or related field 
<br>- Solid hands on coding skills in C#, WCF and .NET
<br><br>Preferred Qualifications:
<br>- Proven track record of shipping major projects
<br>- Ability to work in cross functional teams and solid design and interpersonal skills
<br>- Prior experience with Azure, SQL Server, BizTalk, PowerShell and service oriented architecture is desirable
<br>- Knowledge of integration space a plus.
<br><br>We are fast paced, agile but fun team on a mission to provide enterprise solution for integration. We would like to hear from you if the qualifications match.
<br><br>Microsoft is an equal opportunity employer. All qualified applicants will receive consideration for employment without regard to race, color, gender, sexual orientation, gender identity or expression, religion, national origin, marital status, age, disability, veteran status, genetic information, or any other protected status.', 
    N'Software Engineer', N'BS', N'WA', n'https://www.linkedin.com/jobs2/view/43089319?trk=jserp_job_details_text');
INSERT INTO Job VALUES (9, N'Microsoft', N'Are you someone with a passion for data, analytics, insights, and technology? Do you want to be part of a team lighting up actionable insights using machine learning and predictive analytics to help the organization make business decisions using data? 
<br><br>DPES (Data Platform Engineering Systems) Insights team plays a key role in serving the needs of services in the C&E group providing data and analytics. We make it easier for teams to gain insights by bringing together relevant data into central systems. We understand the data, curate it, and develop machine learning models to help support the information ecosystem. We are never short of scenarios that can benefit from machine learning that spans over business, customer, operational, and engineering areas. Examples include customer behavior prediction and anomaly detection of the system. We are looking for a few passionate, creative, analytical and experienced individuals who love machine learning / big data, and aren\'t afraid of shipping fast at massive scale.
<br><br>As a Data Scientist, you will come up with ML solutions, design and experiment with ML models, implement to operationalize them to solve customer problems and enable breakthrough experiences.
<br><br><b>Responsibilities</b>
<br>- Design, prototype, implement and test machine learning and predictive analytics models
<br>- Architect and develop systems that can run these models at scale
<br>- Partner with MSR to develop new algorithms and techniques to solve new problems and obtain better model performance
<br>- Partner with teams to identify and explore opportunities for the application of machine learning and predictive analysis
<br>- Perform ad-hoc exploratory and explanatory analysis
<br>- Ingest, transform, and manipulate massive datasets in Cosmos or Hadoop or equivalent
<br>- Provide machine learning and analytical leadership to internal partners
<br><br><b>Requirements</b>
<br>- MS or PHD in machine learning, computer science, mathematics, statistics or equivalent technical or analytical field
<br>- Software engineering skill in one or more high level languages (C#, C++, Java, F#), data manipulation (SQL, Cosmos, Hadoop), one or more scripting languages (Python, Perl), and common ML and analysis tools (R, SAS, SPSS, MatLab)
<br>- Multiple years of relevant experience shipping machine learning or predictive analytics models at massive scale
<br>- Exceptional written and verbal communication and presentation skill
<br><br>Microsoft is an equal opportunity employer. All qualified applicants will receive consideration for employment without regard to race, color, gender, sexual orientation, gender identity or expression, religion, national origin, marital status, age, disability, veteran status, genetic information, or any other protected status.', 
    N'Machine Learning', N'PhD', N'WA', N'https://www.linkedin.com/jobs2/view/33996099?trk=jserp_job_details_text');
INSERT INTO Job VALUES (10, N'Amazon', N'Listing Info
<br><br>Ready to help write the next chapter in the publishing industry?
<br>The Amazon Kindle business has grown from a single eink device with 88K titles to become the leader in the e-reader category with millions of titles in 2014.With the launch of a new subscription product (Kindle Unlimited) and growth in other international programs, the Kindle team needs data analyst who can drive new insights to help customers and to grow our business.
<br><br>As a Data Analyst for the Kindle Content Acquisition team, you will be the ultimate data expert for the ebook business. You will be charged with finding the most accurate, timely and scalable solutions to our key strategic questions. Examples of what you will own: metrics used to run the new business development programs, delivery of data used by the vendor management team, and coordination of the reporting across global teams. You’ll be working with multiple Kindle groups including Finance and Operations, so demonstrable teamwork skills are a must.
<br><br><b>Responsibilities</b>
<br><br>· Delivery of data used for Weekly/ Monthly business reviews
<br>· Ad hoc analysis for new business development
<br>· Create dashboards and tools to improve visibility into publisher performance
<br>· Coordination of data consistency across multiple Kindle BI teams
<br><br>· Write PL/ SQL queries for scheduled and ad hoc reports (ETL)
<br>· Advanced PL/ SQL query skills
<br>· Demonstrable delivery of on-time projects
<br>· Advanced Excel skills (Powerpivot, BISM)
<br>· Bachelor’s Degree or related experience
<br><br>· Experience in statistics (e.g. regression, crosstabs, and cluster analysis) or economics
<br>· Experience creating forms and other UIs to retrieve and display data (e.g. MS Access forms)
<br>· Experience in setting up and maintaining self-service BI tools', 
    N'Data Analyst', N'BS', N'VA', N'https://www.linkedin.com/jobs2/view/51502454?trk=jserp_job_details_text');
INSERT INTO Job VALUES (11, N'Amazon', N'Are you a Senior Systems Engineer with a deep understanding of Active Directory Federation, VPN, two-factor authentication and Kerberos? Can you build and automate solutions that empower customers and reduce support costs? If the answer to these questions is YES, then the Corporate Identity and Authentication team at Amazon.com wants to talk to you.
<br><br>The team’s mission is to deliver robust, highly available, and easy to use services to our internal customers across the global enterprise. We are looking for an engineer who is an expert in authentication technologies, specifically SAML-based federation using Microsoft Active Directory Federation Services, Kerberos, Cisco ASAs, and Gemalto authentication services. As a Systems Engineer you will help design and build the future of authentication at Amazon while maintaining the current global infrastructure. To be successful in this position you must have a strong desire to automate, lead, and be comfortable taking imitative. You\'ll be part of a strong team in a fast-paced, start-up like environment. This is an opportunity to work with distributed systems on a massive scale across multiple data centers, multiple countries and thousands of customers.
<br><br>You will be responsible for implementation, monitoring and maintaining the critical systems that all Amazonians depend on. This also includes capacity planning, project coordination, and providing on-call technical support.
<br>5+ years engineering Microsoft Active Directory Domain Services solutions in large scale (over 10,000 users) 24/7 environments
<br>2+ years engineering federated identity solutions
<br>Ability to program to solve problems and automate repetitive tasks in a common scripting or programming language such as Perl, PowerShell, and/or VBScript.
<br>Successful track record of driving complex projects to completion
<br>Bachelor’s Degree in Computer Science or related field, or 5+ years relevant work experience.
<br><br>Experience engineering identity federation using Microsoft Active Directory Federation Services
<br>Expert knowledge in Kerberos and cross-realm authentication concepts
<br>2+ years’ experience in Linux system administration
<br>Experience designing and supporting claims-based authentication mechanisms integrated to Active Directory Domain Services (Active Directory Federation Services for example)
<br>Understanding of VPN design and implementations using Cisco ASAs
<br>Working knowledge of two-factor authentication
<br>Flexibility, thinking on your feet, and strong problem solving skills
<br>Clear, professional communication skills able to contribute to team discussions, knowing when to contribute, when to listen, and when to ask questions.
<br>Demonstrable track record dealing well with ambiguity, prioritizing needs, and delivering measurable results in an agile environment', 
    N'Systems Engineer', N'BS', N'WA', N'https://www.linkedin.com/jobs2/view/44202273?trk=jserp_job_details_text');
INSERT INTO Job VALUES (12, N'Twitter', N'
<b>Listing Info</b>
<br>As an Agency Development Manager at Twitter, you will play a key role in supporting agencies with best practices, education, API/technical support and research opportunities. You’ll help us develop strategic relationships, from the global holding company-level to individual agencies of all types (creative, media social, PR), to ensure that we deliver optimal value to agencies. We want agencies to innovate breakthrough programming featuring Twitter; the Agency Development Manager will play a critical role in arming agencies with the knowledge and tools to develop and sell in these ideas to their clients.
<br><br><b>Responsibilities</b>
<br>Serve as a liaison between agencies and Twitter to help them develop and build first class programs for brands
<br>Explain and demonstrate how and why individuals use Twitter to help marketers identify and inspire authentic uses of Twitter for their brand or clients
<br>Develop and conduct educational bootcamp-style training to inform about best practices for using Twitter. Work with agencies to uplevel their creative thinking and structure programs that deliver positive business impact for their clients
<br>Work with agencies to document and merchandise innovative uses of Twitter: discover, catalog and \'case\' great Twitter usage stories and evidence that will help shape the agency, brand and media world\'s understanding of how brands can use Twitter
<br>Provide an overview of the Twitter ecosystem, including owned- and operated-Twitter properties and third party products and services that rely on the Twitter API, e.g., power-user platforms, campaign management, and analytics services
<br>Consult about use and set up of Twitter data, visualizations and other ways to display real-time Twitter activity within agency and brand environments
<br>Advise agencies about programs and (re)structuring they might consider to increase the knowledge, or improve the performance, of their internal account teams
<br>Ensure that agencies’ voice, opinions, ideas and feedback are being conveyed back to Twitter and its Marketing and Product Development teams. Provide input to Product Marketing & Product teams about advertiser insights and needs for new products, features and solutions
<br>Work with Product Marketing and Packaging teams on sales materials development
<br>Partner with sales to develop agency support plans
<br>Grow agency relationships to increase Twitter fluency and grow revenue across major accounts
<br>Innovate Twitter-led programs that further build relationships and increase Twitter fluency among agencies
<br><br><b>Qualifications</b>
<br>BA/BS degree preferred: Masters degree or equivalent experience a plus
<br>8+ years marketing experience in an agency or media sales support function with a focus on emerging and social media
<br>Demonstrated ability to think strategically about a particular industry and/or product set
<br>Deep expertise in social media platforms, and demonstrated experience in Twitter best practices
<br>Strong client-facing skills. Comfortable with presenting to clients and agencies—in both small or large groups
<br>Familiarity with global agency holding companies and strong relationships across the agency landscape
<br>Ability to partner within cross-functional teams
<br>Ability to consult and bring ideas to the table
<br>Strong teamwork and collaboration skills
<br>Ability to build internal networks to accomplish goals through collaboration with resources across teams
<br>Strong writing and copy editing skills
<br>A self-starter who takes initiative and is action oriented
<br>Can balance the need for quick turnaround with longer-term strategic efforts
<br>Is flexible and can deal effectively with changes in priorities or ambiguity
<br>Is driven and solution-oriented and can overcome obstacles to drive projects through completion
<br>Comfortable with a fast-paced, always-on, start-up environment
<br>Strong PowerPoint and Keynote skills
<br>Alignment to Twitter’s vision and core values', 
    N'Sales', N'BS', N'NY', N'https://www.linkedin.com/jobs2/view/56030774?trk=jserp_job_details_text');
INSERT INTO Job VALUES (13, N'Twitter', N'
<b>Listing Info</b>
<br>Twitter is a unique source of real-time information, offering amazing opportunities for automatic content understanding. The format of this content is diverse (tweets, photos, videos, music, hyperlinks, follow graph, ...), the distribution of topics ever-changing (on a weekly, daily, or sometimes hourly basis), and the volume ever-growing; making it very challenging to automatically and continuously expose relevant content. Manually defining features to represent this data is showing its limits. Our team, Twitter Cortex, is responsible for building the representation layer for all this content. As an architecture engineer at Twitter Cortex, you will help us build, scale and maintain the backbone of our online learning systems, and directly impact the lives of our users and the success of our business.
<br><br>We are looking for a number of passionate, talented, entrepreneurial engineers to join the team in New York to help us build the foundations for our deep learning platform.
<br><br><b>Responsibilities</b>
<br>Contribute and maintain CUDA (GPU) routines
<br>Contribute low-level optimizations in C (SSE, vectorization, …)
<br>Maintain a complex numeric library (Torch7)
<br>Maintain a bridge between open-source code base (torch.ch) and internal code base
<br>Contribute to overall library design (Torch7 + auxiliary neural network and deep learning packages)
<br>Balance out your desire to ship code with your responsibility to get it right
<br><br><b>Requirements</b>
<br>Extensive experience with low-level programming (C, C++, Vectorization, …)
<br>Experience with CUDA (GP-GPU) programming
<br>Experience with mixed language frameworks and foreign function interfaces (FFI)
<br>Experience with software engineering best practices (e.g. unit testing, code reviews, design documentation)
<br>Strong algorithms and data structures background
<br>BS, MS, or PhD in Computer Science or equivalent work experience
<br><br><b>Desired</b>
<br>Experience with Lua / LuaJIT
<br>Extensive experience as a contributor to large open-source frameworks
<br>Familiarity with numeric algorithms and machine learning algorithms', 
    N'Software Architecture', N'MS', N'NY', N'https://www.linkedin.com/jobs2/view/51141474?trk=jserp_job_details_text');
INSERT INTO Job VALUES (14, N'Twitter', N'
<b>Listing Info</b>
<br>Twitter is a unique source of real-time information, offering amazing opportunities for automatic content understanding. The format of this content is diverse (tweets, photos, videos, music, hyperlinks, follow graph, ...), the distribution of topics ever-changing (on a weekly, daily, or sometimes hourly basis), and the volume ever-growing; making it very challenging to automatically and continuously expose relevant content. Manually defining features to represent this data is showing its limits. Our team, Twitter Cortex, is responsible for building the representation layer for all this content. As a systems engineer at Twitter Cortex, you will help us build, scale and maintain the backbone of our online learning systems, and directly impact the lives of our users and the success of our business.
<br><br>We are looking for a number of passionate, talented, entrepreneurial engineers to join the team in New York to help us build the foundations for our deep learning platform.
<br><br><b>Responsibilities</b>
<br>Design, contribute and maintain efficient production code to an automated offline and online machine (deep) learning platform/service
<br>Contribute to a mixed stack/full stack environment: the platform will include production backend code (scala), training jobs (lua, C, CUDA), web services and all the way to frontend code for live monitoring
<br>Maintain a complex live system with production data dependencies, low-latency requirements
<br>Work in a collaborative manner with team members in remote offices
<br>Be awesome in developing JVM services (Scala, Java)
<br>Balance out your desire to ship code with your responsibility to get it right
<br><br><b>Requirements</b>
<br>Extensive experience with web infrastructure, distributed systems, performance analysis, search infrastructure and/or large-scale data processing
<br>Experience with software engineering best practices (e.g. unit testing, code reviews, design documentation)
<br>Strong algorithms and data structures background
<br>BS, MS, or PhD in Computer Science or equivalent work experience
<br><br><b>Desired</b>
<br>Familiarity with numeric algorithms and machine learning algorithms
<br>Open-source contributor', 
    N'Software System', N'MS', N'NY', N'https://www.linkedin.com/jobs2/view/51142433?trk=jserp_job_details_text');
INSERT INTO Job VALUES (15, N'Twitter', N'
<b>Listing Info</b>
<br><br>Data Scientist - Machine Learning (New York) Software Engineering | New York City, NY
<br><br>As a Twitter Data Scientist specializing in Machine Learning, you will use machine learning and data mining techniques to better understand how users engage with Twitter, participate in creation and measurement of new and experimental features, and define meaningful success metrics for Twitter products. You should be passionate about finding insights in data and using quantitative analysis to answer complex questions. You should have a strong background in statistics and data analysis. Experience in modeling, machine learning, and working with large datasets is a plus.
<br><br><b>Responsibilities</b>
<br>Conduct statistical analyses to learn from and scale to petabytes of data
<br>Use Map-Reduce frameworks such as Pig and Scalding, statistical software such as R, and scripting languages like Python and Ruby
<br>Write and interpret complex SQL queries for standard as well as ad hoc data mining purposes
<br>Communicate findings to product, engineering, and management teams
<br><br><b>Requirements</b>
<br>MS or PhD in Statistics, Math, Engineering, Operations Research, Computer Science, or another quantitative discipline.
<br>Experience with statistical programming environments like R or Matlab
<br>Experience with scripting languages (Python and/or Ruby), regular expressions, etc.
<br>Interest in using discrete math, probability, and statistics to answer complex questions
<br>Experience in mapping business needs to engineering systems
<br><br><b>Desired</b>
<br>Three or more years of industry experience 
<br>Experience with large datasets and map-reduce architectures like Hadoop
<br>Experience or passion for data visualization, presentation, and communication
<br>Passion for the Twitter product', 
    N'Machine Learning', N'MS', N'NY', n'https://www.linkedin.com/jobs2/view/51139981?trk=jserp_job_details_text');
INSERT INTO Job VALUES (16, N'Twitter', N'
<b>Listing Info</b>
<br><br>Fabric - iOS Software Engineer Software Engineering | Boston, MA
<br><br>Interested in revolutionizing the mobile development landscape?  Read on.
<br><br>Fabric, a Modular Mobile Platform Recently Launched By Twitter Makes It Easy For Developers To Build Great Apps. With Fabric, Twitter Is Taking a Major Step, Moving From a Company Solely Focused On Building And Monetizing a Great Consumer App, To a Mobile Services Company Playing a Key Role In The Broader Mobile Ecosystem. Fabric Brings Together The Best Of Twitter And a Number Of Our Recent Acquisitions
<br>Crashlytics\' crash reporting, beta testing and analytics
<br>Twitter\'s login, Tweet compose, and Tweet embeds
<br>MoPub\'s monetization platform for mobile apps
<br>Digits, an entirely-new mobile-first identity solution. 
<br><br>It brings these services together into a single, powerful, modular, cross-platform SDK. Our goal is to be the first SDK developers include in their app, and thereby become a core part of every app on iOS and Android.
<br><br>Sound cool? Great - because we are looking for an engineer that is a champion of development, and who loves writing code and spreading that emotion to others!
<br><br><b>About You</b>
<br>You’re smart, get stuff done, have great energy, and thrive in a fast paced environment.
<br>You are passionate about programming.  We work with the highest-level frameworks to the lowest-level bits of software... all the way down to Assembly.  If you aren\’t afraid to work on low-level stuff, you are in the right place.
<br>You’re passionate about mobile app development and making life easy for mobile developers.
<br>Strong knowledge of either Objective-C or C.
<br>You are just as passionate about Mac OS X as you are about iOS.
<br>You are ready to aggressively push your code out to our customers day one, and you are committed to building a flawless customer experience. We are a team with a passion for great user experiences on mobile and the web… so we want someone with the ability work closely with the design team to create a world class experience for our users.
<br>Desire to create software that is fast, lightweight, easy and powerful, because we are all about that!
<br>Willingness to write your own unit tests and documentation. This is super important to us!
<br><br>In addition, it would be great if
<br>You have previous experience developing SDKs or frameworks.
<br>You\’re an active contributor to any open source projects.
<br>You\’ve had previous exposure to building large scale services on the web.
<br>You\’re interested in sharing the innovative work you do at conferences, meetups, etc.
<br>You have knowledge of debugging tools/infrastructure like symbolication (LLDB and GDB).
<br>You have knowledge of libdispatch and asynchronous programming.
<br>You have experience with Apple APIs, and the APIs from some other platforms as well. 
<br><br><b>About Us</b>
<br>We\'re looking for truly talented engineers with a passion for clean code and great products. Our team is fast, smart and independent -- located in both San Francisco, CA (Twitter HQ) and Cambridge, MA.
<br><br><b>Just a Few Of The Things That Set Us Apart</b>
<br>We love feedback - you\’ll be able to connect directly with customers who are using what you\’re building and use their input to make the product better.
<br>We ship early and often - we\'re huge fans of TDD, build/measure/learn, and are moving towards continuous deployment.
<br>We seek to simplify - measuring success by benefit to customers, not vanity metrics.
<br>We give back - We encourage open source contributions and community participation.
<br>We\’re hyper technical - Deep understanding and optimization are in our soul - what can your code accomplish in 18ms?', 
    N'iOS Software Engineering', N'BS', N'MA', N'https://www.linkedin.com/jobs2/view/51140611?trk=jserp_job_details_text');
INSERT INTO Job VALUES (17, N'HP', N'
<b>About HP</b>
<br>HP is the world\'s largest provider of information technology infrastructure, software, services, and solutions to individuals and organizations of all sizes. Ranked 10 on the Fortune 500 list for 2012, HP brings together a portfolio to serve more than 1 billion customers in over 170 countries on six continents. HP invents, engineers, and delivers technology solutions that drive business value, create social value, and improve the lives of our clients.
<br>At HP, we live for the big idea, the next great discovery. "Invent" is more than a word: it’s who we are. Our innovations in the key strategic areas of Big Data, Cloud, Mobility, and Security help shape the technology industry. Everything we do, we do to make technology more practical, usable, and valuable to our customers. Are you ready to give your career the boost it deserves?
<br>At Hewlett-Packard, we invent new technologies, change markets, and create business opportunities. Teamwork, initiative, innovation and appropriate risk-taking are emphasized by this highly motivated and successful design team. We help plan and broaden the company strategy and deliver the science and technology that gives HP leadership in the industry. As members of the Silicon Design Lab (SDL), we design the chipsets that power HP’s high performance computing systems. SVL has sites in Houston, TX; Plano, TX, and Fort Collins, CO.
<br>Design Verification is an integral part of computer hardware development within SDL. The verification team is responsible for ensuring that new High End Compute Server product designs are free from functional defects prior to fabrication. The team consists of hardware and software engineers with an in-depth knowledge of logic design, computer architecture, systems design, and software development practices; team members have a desire to create leading design verification methodologies.
<br><br><b>EXPECTED RESPONSIBILITY:</b>
<br>The job requires a knowledge of computer architecture including, cache coherency, multi-computer design, as well as an understanding of software development practices and methodologies. Under the guidance of a mentor, the candidate will use his/her knowledge of hardware design, computer architecture, and software development to complement the existing team in ensuring that new HP compute products are free from functional defects prior to fabrication.
<br><br><b>QUALIFICATIONS:</b>
<br><br>MUST HAVE:
<br>College graduate with BS, MS or PhD degree in EE, ECE, CE or equivalent
<br>Strong understanding of logic design and computer architecture
<br>S trong programming skills
<br>Strong communication and teamwork skills 
<br><br>DESIRED EXPERIENCE:
<br>The ideal candidate for this position would have the following experience/knowledge:
<br>Leadership experience at university and/or participation in extracurricular activities in student organizations and and/or community service
<br>Prior internship experience
<br>Coursework in C or C++ in a UNIX environment
<br>Coursework in object oriented design
<br>Introductory understanding of design verification principles and practices
<br>Course work in computer architecture, software engineering, data structures, VLSI design, and fault tolerant computing
<br>Solid understanding of basic EE fundamentals', 
    N'VLSI Design', N'BS', N'TX', N'https://www.linkedin.com/jobs2/view/44225451?trk=jserp_job_details_text');
INSERT INTO Job VALUES (18, N'HP', N'
Minimum Clearance Level: Public Trust Clearance
<br>Citizenship Required: US Citizenship
<br>Site: Virginia - Alexandria
<br>Job Description:
<br>PURPOSE & PROJECT SUMMARY: In support of the Defense Manpower Data Center (DMDC) this Graduate Job/Entry Java Developer Java J2EE Developer will work supporting applications under the contract. In addition, maintaining and enhancing existing applications, may include migration of existing systems to newer technology. The candidate is expected to provide the services that are required, to successfully implement and deliver solutions in the J2EE platform, that are stable, reliable, scalable, well documented, and of high quality. This candidate will work on the military’s software system to provide code relative to application information.
<br><br><b>JOB DESCRIPTION:</b>
<br>Understands full Software Development Life Cycle and proficient in Java Platform, Enterprise Edition (Java EE) application development skills.
<br>Responsible for implementing part or all of the technical solution to the client, in accordance with an agreed technical design. Occasionally responsible for providing a detailed technical design for enterprise solutions.
<br>Responsible for working with the project team to develop and maintain the application.
<br>Responsible for develop design documentation based on application requirements
<br>Responsible for developing and testing code per project schedule
<br>Responsible for escalating risks and issues to the Project Manager
<br>Responsible for assisting in troubleshooting production support issues.
<br>Responsible for providing technical support and input on the application of technology.
<br>Responsible for providing advice on solution and integration opportunities to defined segments.
<br>Contributes to knowledge tools and communities, and ensures project learning’s are documented and shared.
<br>The candidate must be self-motivated with excellent communication and problem solving skills, able to work independently with little guidance, and able to work in a team environment.
<br><br><b>QUALIFICATIONS:</b>
<br>Qualifications:
<br>This entry-level Java / J2EE Developer designs, develops, implements, and supports business applications using Java technologies for the Defense Manpower Data Center (DMDC). This particular position would currently work on some front end, but mainly backend applications. A successful candidate would have a desire to develop their learnings and skills for this product line and be able to understand the business surrounding the applications. Other tasking would include: coordinates and collaborates with others in analyzing collected requirements to ensure plans and identified solutions meet customer needs and expectations. Builds, confirms, and prioritizes project plans and deliverables with the Product Managers. Working in a highly collaborative and teaming environment this person will develop and execute unit test plans, ensuring that results are documented and reviewed with the Quality Assurance teams responsible for integrated testing. This developer will create technical documentation in support of new development, upgrades and enhancements. This developer should understand standard web practices to aid their team towards utilizing new technologies, engaging in appropriate project management & system development methodologies, as well as unit testing best-practices.
<br>• Bachelor’s Degree required (computer science, information systems, business major preferred)
<br>• Excellent oral and written communication skills to articulate technical or operational problems into understandable business terms appropriate for the audience.
<br>• Proven ability to analyze, design and develop applications using an object oriented approach.
<br>• Experience developing Java and Java EE applications
<br>• Experience using web application frameworks such as Struts, JavaServer Faces, Spring, or WebLogic JMS.
<br>• Experience using LINK or Hybernate for database persistence layer.
<br>• Experience using an Integrated Development Environment (e.g., Eclipse, JDeveloper).
<br>• Prior experience with the following tools is beneficial but not required: Oracle 11g web/app server, Subversion for source control, and Maven build process
<br>• Ability to consistently apply quality and security standards.
<br>• Ability to work effectively in a team and with clients.
<br>• Strong skills in troubleshooting - determine causes of errors and drive problem resolution to ensure business continuity
<br>• Experience with testing tools, unit and integration test scripting and testing methodologies.
<br>• Java certifications preferred but not required.
<br>• Knowledge of AGILE software development using SCRUM, preferred but not required.
<br><br><b>TECHNOLOGY REQUIREMENTS:</b>
<br>• Java and Java EE development
<br>• Object Oriented Development
<br>• Knowledge of relational databases and SQL
<br>• Experience with web services and SOA framework, preferred but not required.', 
    N'Java Application', N'BS', N'DC', N'https://www.linkedin.com/jobs2/view/44226316?trk=jserp_job_details_text');
INSERT INTO Job VALUES (19, N'HP', N'We are looking for an outstanding entry level engineer with some exposure to Objective C & iOS development. This resource will advance our iOS expertise by designing, implementing and testing mobile applications for the online photo merchandising market. We need a developer who brings an understanding of iOS but is more importantly grounded with a solid theoretical foundation in computer science and a broad knowledge of algorithms, data structures & concurrency.
<br>While collaboration and being a team player is a key to success in this role, this resource will spend the bulk of their time autonomously developing applications. There will be an emphasis on apps that recreate existing web experiences.
<br><br><b>Duties:</b>
<br>Collaborate with the Product Manager, Designers, Engineers, Technical Writers & QA.
<br>Develop & own the UI and application logic for an application in the photo merchandising market.
<br>Assist with estimating, planning, executing and monitoring quality of the project.
<br>Advocate for the best practices in mobile programming, how best to leverage native capabilities, recommend process improvements and toolsets to make developers more effective and efficient.
<br>Leverage platform specific frameworks where needed.
<br>Perform quality reviews on code.
<br><br><b>Qualifications</b> 
<br><br><b>Skills</b>
<br>Entry level position. Internships leading to an entry level position will be considered.
<br>Proficiency in object oriented programming & design patterns.
<br>Experience with Objective C. Have knowledge of core areas of iOS programming such as memory management and asynchronous programming.
<br>Exposure to with web architectures and familiarity with databases.
<br>Experience with REST/JSON/XML.
<br>Energetic, inspired, dedicated, passionate about software development.
<br>Ability and willingness to learn the existing system quickly and with little top down management.
<br>A great team player, sociable, with excellent communication skills.
<br>Bachelor\'s degree in Computer Science or equivalent desirable.', 
    N'iOS Software Engineering', N'BS', N'CA',N'https://www.linkedin.com/jobs2/view/41632239?trk=jserp_job_details_text');
INSERT INTO Job VALUES (20, N'Yahoo!', N'
    <b>Listing Info</b>
<br>Yahoo! currently  has a Tech Yahoo!, Software Systems Development Engineer  position available at our office in Champaign, Illinois. DUTIES: Working on projects of diverse scope and complexity, design, build, implement, modify, test, debug, and deploy software systems, large-scale infrastructure platforms, and network services that are the foundation of multiple Yahoo properties and applications.  Responsible for performance, reliability, availability, scalability, and security.  Services are delivered to applications through standard and proprietary protocols and behavior may be customized via complete APIs (Application Programming Interfaces) and/or web services.  Design, implement, test, and deploy algorithms for ultra-large scale data collection, transfer, copy, and delivery in both streaming and batch modes according to requirements specifications.  Investigate, compare, design, implement, test, and deploy infrastructural changes for improved performance and data throughput.  Support and enhance high performance, multi-processing, multi-threaded software that executes reliably in a 24x7 operating environment.
<br><br><b>EDUCATION/EXPERIENCE REQUIREMENTS:</b>  
<br>Master’s degree in Computer Science, Engineering, or related technical field plus 3 years’ experience in job offered or other computer related position.
<br><br><b>ALTERNATE EDUCATION AND EXPERIENCE REQUIREMENTS:</b> 
<br>Bachelor’s degree in Computer Science, Engineering, or related technical field followed by 5 years progressive experience in job offered or other computer related position.
<br><br><b>Experience/Coursework Must Include</b>
<br>Knowledge of data communication software such as HTTP, TCP, IP, or FTP; debugging and reverse-engineering existing proprietary software products; java; object oriented programming
<br><br><br>Any suitable combination of education, training, or experience is acceptable', 
    N'Software System', N'MS', N'IL', N'https://www.linkedin.com/jobs2/view/51009055?trk=jserp_job_details_text');
INSERT INTO Job VALUES (21, N'Yahoo!', N'
Yahoo currently  has a Tech Yahoo, Software Systems Development Engineer position available at our offices in San Francisco, CA
<br><br><b>DUTIES:</b>  
<br>Work closely with product, design, and other developers to define, lead, build, and support localized versions of the Yahoo Sports application.  As Yahoo Sports expands into international markets to provide high quality, regionally relevant sports coverage, lead the internalization and localization efforts to add bidirectional language support (right-to-left) to the Yahoo Sports Mobile apps to support Arabic and other right-to-left language formats.  Lead and contribute to building new app features and supporting existing app features for Yahoo’s iOS Sports app, with an emphasis on international sports experiences. 
<br><br><b>REQUIREMENTS:</b>  
<br>Master’s degree or foreign equivalent degree in Computer Science, Computer Information Systems, Computer Engineering, or a related field and two years of experience in software engineering.
<br><br><b>Alternative education and experience requirements:</b> 
<br>Bachelor’s degree or foreign equivalent degree in Computer Science, Computer Information Systems, Computer Engineering, or a related field and five years of progressive, post-baccalaureate experience in software engineering.
<br><br>This position also requires education or experience in: Objective-C; UIKit; Cocoa Touch frameworks; XCode development environment; Applications localization utilizing right-to-left/bidirectional; and building and releasing high quality mobile apps.
<br><br><br>Any suitable combination of education, training, or experience is acceptable.', 
    N'Software System', N'MS', N'CA', N'https://www.linkedin.com/jobs2/view/51006677?trk=jserp_job_details_text');
INSERT INTO Job VALUES (22, N'Yahoo!', N'
Yahoo currently has a Tech Yahoo, Software Development Engineer, Sr. position available at our offices in San Francisco, CA
<br><br><b>DUTIES:</b> 
<br>Define, design, develop, and complete major new features in current and future products.  Lead the design effort for a system component, defining priorities and evaluating resources.  Assess business metrics requirements for online video advertising platform.  Create multi-year technology plan to automate collection and analysis of large-scale web events, financial transaction history, and user behavior.  Identify and extract business insights relevant to online video advertising ecosystem based on all available data.  Create and execute presentations on technical topics related to large-scale data analysis for customers, prospective customers, and industry experts.
<br><br><b>REQUIREMENTS:</b>  
<br>Master’s degree or foreign equivalent degree in Computer Science, Engineering, or a related field and three years of experience in developing solutions requiring storage and processing of data using commodity hardware.
<br><br><b>Alternative Requirements:</b> 
<br>Bachelor’s degree or foreign equivalent degree in Computer Science, Engineering, or a related field and five years of progressive, post-baccalaureate experience in developing solutions requiring storage and processing of data using commodity hardware.
<br><br><b>Experience/coursework must include:</b> 
<br>MySQL; Pig/Hive; Scala or related JVM-based language; HDFS; HBase; Hadoop; and Development with distributed aggregation and transport technologies.
<br><br><br>Any suitable combination of education, training, or experience is acceptable.', 
    N'Software Engineering', N'MS', N'CA', N'https://www.linkedin.com/jobs2/view/51006649?trk=jserp_job_details_text');
INSERT INTO Job VALUES (23, N'IBM', N'
<br>IBM Interactive is a team of mobile subject matter experts that are regarded as thought leaders and innovators with proven track records of success. IBM Interactive is continuing to expand to meet client demand. As a result a number of exciting opportunities have arisen for skilled mobility professionals to become part of the Global Practice team. As a member of the world\'s leading and largest consulting organization, you\'ll tap into resources that only a global leader like IBM can provide: access to a vast and diverse network of talented professionals; enjoy unparalleled career opportunities; be provided with ongoing training and education that you\'ll need to succeed; and work on some of the most interesting projects on the planet, helping everyone from organizations to local governments, work smarter. 
<br><br>Objective C/Swift iOS developer to participate in the design and development of highly interactive iPhone and iPad projects for high profile projects. This position requires well-rounded development skills with front end development experience including HTML and Apple\'s iOS Software Development Kit (SDK). The ideal candidate will have iOS development experience in high profile interactive projects. As a Senior Developer, you will also be required to assist in mentoring junior iOS Developers and growing them into world class senior developers, ensuring the quality of the code on projects and demonstrating iOS Developer eminence at conferences or by publishing white papers.
<br><br>We expect a understanding of iOS design patterns/coding conventions, Apple?s Human Interface Guidelines, and App Store Review Guidelines as well as:
<br>An understanding of client-server development in a mobile environment
<br>Proven architecture skills
<br>Experience with task planning and estimating effort
<br>Experience leading projects and overseeing development teams
<br><br>When working with other key stakeholders the candidate should be able to articulate deeply technical concepts in a customer friendly and understandable way. This would involve being able to assist with project managers, designers and information architects in scoping and pricing front end applications as well as working with a team of developers during the build, test and deployment phases. We're looking for engineers who care about the quality of their code. Engineers who are passionate about providing the best solution to meet the client's needs and anticipate their future needs based on an understanding of the market. We seek developers with object-oriented design skills and a track record of delivering designs to market, a solid understanding of the Software Development Life Cycle (SDLC), and a fundamental love of Application Programming Interface (API), with expertise in rapid prototyping, with the ability to quickly go from mock-ups to implementation.
<br><br>Preferred skills include adaptive design, a sense of UX, mobile design patterns, and visual design with an eye for simple-to-use interfaces, as well as a working knowledge of testing from unit to functional in a mobile context, and Agile development processes including Scrum.
<br><br>It is also expected that new hires live within a reasonable commuting distance (generally 50 mi or less) of Chicago, IL.
<br><br>As a member of the world\'s leading and largest consulting organization, you\'ll tap into resources that only a global leader like IBM can provide: access to a vast and diverse network of talented professionals; enjoy unparalleled career opportunities; be provided with ongoing training and education that you\'ll need to succeed; and work on some of the most interesting projects on the planet, helping everyone from organizations to local governments, work smarter.
<br>(iXMiOS)
<br>(2252)
<br>LI- BJ1
<br><br>Mobile
<br>High School Diploma/GED
<br>At least 2 years experience in developing iOS applications
<br>At least 2 years experience in aspects of the mobile lifecycle. Examples include: application development (application structure, device and operating system API?s, debugging, performance, security) and deployment.
<br>At least 2 years experience in one of more of the following: Ajax, REST, JSON
<br>At least 2 years experience in using version control systems such as GIT
<br>At least 2 years experience in leading development teams
<br>At least 2 years experience in estimating development effort
<br>Readiness to travel Up to 4 days a week (home on weekends-based on project requirements)
<br>English: Fluent', 
    N'iOS Software Engineering', N'BS', N'IL', N'https://www.linkedin.com/jobs2/view/51840783?trk=jserp_job_details_text');
INSERT INTO Job VALUES (24, N'DELL', N'
<b>Listing Info</b>
<br><br>Job Description Location: Atlanta, GA
<br><br>Sr. Security Architect - Dell SecureWorks
<br><br>Dell SecureWorks is a market leader in information security services with more than 4,000 clients worldwide spanning North America, Latin America, Europe, the Middle East and the Pacific Rim.  Organizations of all sizes, across all industries rely on Dell SecureWorks to protect their assets, improve compliance and reduce costs.  The combination of strong client service, award-winning security technology and experienced security professionals makes Dell SecureWorks the premier provider of information security services for any organization.  Positioned as a leader of the MSSP industry by several global industry analyst firms, Dell SecureWorks also has received SC Magazine’s “Best Managed Security Service” award and Frost and Sullivan’s North America Security Incident Mitigation and Response Client Value Leadership Award, among others.
 <br><br><b>Role Overview</b>
<br>You will be a key member of a team responsible for executing strategic engagements our Security Design & Architecture practice, including assisting security services sales, and managing program execution, and customer relationships in order to grow Dells security architecture business.
<br>You will work closely with the rest of the security services delivery organization and services sales organization in order to identify, qualify and maximize revenue for the full information security services portfolio, for both existing and new accounts.
 <br><br>This position requires up to 50-60% travel.
 <br><br><b>Role Responsibilities</b>
<br>Build and execute programs to help customers determine and assess security requirements by evaluating business strategies and requirements, conducting system security and vulnerability analyses and risk assessments, and preparing security architecture/platform requirements
<br>Develop programs that help customers plan security systems by evaluating network and security technologies, developing requirements for local area networks (LANs), wide area networks (WANs), virtual private networks (VPNs), routers, firewalls, and related security and network devices adhering to customer requirements and industry standards
<br>Assume a lead role as a trusted advisor for large and complex integrated information security projects
<br>Directly interface with the external customer on projects
<br>Manage the execution of complex sales activities to new and existing customers
<br>Serve as a strong contributor role for the writing of complex and unique proposals, with input and contribution from fellow large deal pursuit team members
<br>Present proposals, and develop and present custom collateral to help drive a rich understanding of our ideas and solutions to the customer
<br>Support the security service line leaders in executing the different value propositions at your customer
<br>Establish a professional working and consultative relationship with the customer, up to and including the C-level for mid-to-large accounts, by developing a core understanding of the unique business needs of the customer
<br>Understand the customer’s business, their business environment and their information security needs to develop and tailor the most appropriate solution
<br>Work collaboratively with business leaders to align security architecture services and technology, staffing and processes to their organizational strategies and objectives
<br>Solve problems without precedent
<br>Strategize and create new and innovative security architecture solutions that drive changes for our customers benefit
<br>Motivate, challenge and lead peers to achieve business results beyond your direct scope of influence
<br>Develop and enhance our services based intellectual property through research and customer engagement
<br>Assume a lead role as a trusted advisor for large and complex integrated information security projects
<br>Work closely with Dells other security services sales, and related business unites, and be prepared to drive business on your own as well
<br>Make business plans for targeted accounts, together with management
<br>Achieve a minimal level of consulting chargeability, commensurate with, and for the purposes of our business development goals
<br>Negotiate price, discounts, within defined schedules and guidelines
 <br><br>As a managed security provider, Dell SecureWorks expects its employees to understand and apply commonly known security practices and possess a working knowledge of applicable industry controls such as NIST 800-53. Employees will be expected to acknowledge their security responsibilities in writing prior to gaining access to company systems. Employees will be required to maintain a working knowledge of local security policies and execute general controls as assigned.
<br><br><b>Requirements</b>
<br>Proven success architecting security postures for large enterprise engagements
<br>Proven success in delivering large complex information security services solutions
<br>History of achieving or driving the achievement of sales quotas, and the expansion of customer relationships, through collaboration, leadership and innovation
<br>Managed and/or directed information security project(s) of size: >$1 Million
<br>Ability to justify value / business case for information security services solutions
<br>Results orientation and can demonstrate direct contribution or responsibility for very strong sales results
<br>8+ years of information security consulting experience to include 3+ years in a business development role for security services solutions
<br>Undergraduate degree and 8+ years’ relevant experience or Graduate degree and 6+ year’s relevant experience
<br>Experience leading large multi-disciplinary sales pursuit and/or customer engagement teams in a matrix environment
<br>Able to identify issues/roadblocks and proactively identify solutions
<br>Strong communication and presentation skills with experience communicating at the C Level
<br>Demonstrated adaptability
<br>Very strong English language writing skills
<br><br><b>Preferences</b>
<br>Experience in business development at one of the major consulting firms a plus
<br>Past success understanding customers business needs to collaboratively create solutions that challenge the customer’s assumptions and drive strategic value
<br>Previous role as a Security Architect or Senior Security Engineer a plus
<br>Experience selling and delivering IT Strategy and Transformation, Data Strategy and Governance, IT Governance and Effectiveness
<br>Experience with management consulting practices
<br>MBA is preferred but not required
 <br><br>This is a remote position.
 <br><br>Company Description
<br>With more than 100,000 team members globally, we promote an environment that is rooted in the entrepreneurial spirit in which the company was founded. Dell’s team members are committed to serving our communities, regularly volunteering for over 1,500 non-profit organizations. The company has also received many accolades from employer of choice to energy conservation. Our team members follow an open approach to technology innovation and believe that technology is essential for human success.
 <br><br>Why work with us?
<br>Life at Dell means collaborating with dedicated professionals with a passion for technology.
<br>When we see something that could be improved, we get to work inventing the solution. Our people demonstrate our winning culture through positive and meaningful relationships. We invest in our people and offer a series of programs that enables them to pursue a career that fulfills their potential. Our team members’ health and wellness is our priority as well as rewarding them for their hard work.
<br><br>Life At Dell
<br>Equal Employment Opportunity Policy
<br>Equal Opportunity Employer/Minorities/Women/Veterans/Disabled', 
    N'Security', N'BS', N'GA', N'https://www.linkedin.com/jobs2/view/54005437?trk=jserp_job_details_text');
INSERT INTO Job VALUES (25, N'Intel', N'
<b>Listing Info</b>
<br>A team in the Software Services Group (SSG) is searching for an energetic and passionate software OS engineer. In this position, you will have the wonderful opportunity to learn, grow and excel! You will be responsible for leading the architecture, development, analysis, and debug of operating system software enhancements for Microsoft operating systems (OS) and Microsoft virtualization products for small form-factor devices (phone, tablet) products. You will be working closely with engineering and architecture leads of the mobile architecture and product groups at Intel and Microsoft to define and enable the next generation technologies to be competitive in performance and power. If you want to make an impact for Intel\'s upcoming small form factors devices, then come join us in the SSG team! 
<br><br><b>Your Responsibilities Will Include But Not Be Limited To</b>
<br>Influence/drive architecture and product intercept on Intel products with Windows OS and Virtualization products.
<br>Drive the engineering engagement with Intel product teams, Microsoft and IHVs/OEMs to enable the technologies, ensuring right level of platform support to enable, validate and optimize the next generation products and technologies.
<br>Reviewing and enabling processor and platform features for core Windows* OS and Virtualization products
<br>Analyzing, debugging, and evaluating processor and platform errata for current and future Intel(c) processors and platforms
<br>Influence/drive the next generation processor and platform features and architecture definition
<br><br><b>Job Type</b>
<br>College Graduate
<br><br><b>Regular/Temporary</b>
<br>Regular
<br><br><b>Posting Date</b>
<br>Jun 16, 2014
<br><br><b>Apply Before</b>
<br>Ongoing
<br><br><b>Business Group</b>
<br>The Intel Software and Services Group (SSG) connects Intel to the worldwide software community. SSG strives to bring competitive advantage to Intel platforms by helping independent software vendors, operating system developers, OEMs, channel members and systems integrators deliver exceptional customer value and achieve differentiation on Intel® processor technologies. SSG provides global leadership to the software community through its technical expertise, industry enabling activities, and developer products and programs.
<br><br><b>Posting Statement</b>
<br>Intel prohibits discrimination based on race, color, religion, gender, national origin, age, disability, veteran status, marital status, pregnancy, gender expression or identity, sexual orientation or any other legally protected status.
<br><br><b>Minimum Skills And Qualifications</b>
<br>The successful candidate must possess a minimum of a Bachelor\'s or Master\'s Degree in Computer Science, or other relevant degree. You must have also have 6+ months of educational experience in the following areas:
Knowledgeable on computer/processor architecture, small form factor devices (phone, tablet, ect..), OS fundamentals, OS internals, OS-level APIs, Kernel debugger, driver development, System level development / prototype, C/ASM programming, data structures and Algorithms.
Demonstrate familiarity with Intel architecture Intel architecture.
<br><br><b>Preferred Skills And Qualifications</b>
<br>Hands-on experience developing and/or debugging software for small form factor devices (phone, tablet), or SoCs is highly desired.
<br>Expertise in one or more core technologies such as, platform power management, low power IO, sensor architecture, IO driver stacks (such as USB, storage, networking etc.), and virtualization is highly desired.
<br>Work experience is a plus.', 
    N'Operating System', N'BS', N'OR', N'https://www.linkedin.com/jobs2/view/52461901?trk=jserp_job_details_text');
INSERT INTO Job VALUES (26, N'Intel', N'OTG is one of the fastest growing organizations in Intel and we are building teams to develop functionally safe systems. Systems that can be certified as functionally safe are becoming mandatory across many IOTG markets including Industrial, Automotive and Medical where risk to people must be carefully managed and requires low level real-time monitoring of both HW and SW functions. Functional SW safety certification is a specialization that requires a uniquely rigorous development flow, statistical HW failure analysis and development of SW diagnostic routines that fit within an overall SW architecture. We are looking for SW Architects with strong direct HW interface experience to lead development teams initially for Industrial and Automotive applications with growth opportunities. The successful candidate will receive formal functional safety training, learn the required SW design flow and drive a team that develops SW to monitor both HW and SW health. 
 <br><br><b>Responsibilities Include:</b> 
<br>- Architecting a low level SW/HW Test Library and extensible framework to achieve Functional Safety requirements per ISO 26262/IEC 61508 standards 
<br>- Working together with HW architects to define the SW diagnostics to be developed 
<br>- Technically lead a development team 
<br>- Hands-on coding development 
<br>- Creating and driving a SW development process that meets ISO 26262 requirements
<br><br><b>Required Qualifications: </b>
<br>- MSEE/MSCSE plus 4 years of related experience or BSEE/BSCSE plus 6 years of related experience 
<br>- 4 years of C, C++ development, configuration management and debug experience 
<br>- 4 years of experience with Intel Architecture 
<br>- 4 years of technical leadership skills 
<br>- 4 years of experience developing low level SW that directly interfaces with the HW
<br>- 1 year of experience developing SW at the driver or middle-ware level
<br>- 2 years of experience in a SW architecture role (gathering requirements, writing architecture specifications and technically leading a development team)
<br><br><b>Desired Skills:</b> 
<br>- Functional Safety development experience 
<br>- Working knowledge of RTOS\'s including Green Hills, QNX, and VxWorks 
<br>- Virtualization knowledge 
<br>- Working knowledge of Agile SW development methodologies 
<br>- Breadth of knowledge that spans BIOS and drivers 
<br>- Familiarity with PCIe drivers and device driver interaction 
<br>- Demonstrated effectiveness in multitasking over simultaneous problem areas and/or assignments 
<br>- Good team player able to work well with the development team, peers and senior engineers from various supporting disciplines 
<br>- Cross-division, cross-group cooperation and influence 
<br>- Demonstrated independent analysis and thought leadership 
<br>- Tolerance of ambiguity - highly effective in ambiguous environment and demonstrated ability to develop clear strategies and plans with appropriately managed risks 
<br>- Communication - proficiency in facilitating clear and consistent understanding across, time zones and language boundaries 
<br>- Familiarity with ITP debugging and programming  ', 
    N'Software Architecture', N'BS', N'AZ', N'https://www.linkedin.com/jobs2/view/43031867?trk=jserp_job_details_text');
INSERT INTO Job VALUES (27, N'Intuit', N'
<b>Description</v>
<br><br><b>About Intuit Data Engineering and Analytics (IDEA)</v>
<br><br>We Build Awesome Data Products
<br>Core data products for Intuit: A/B testing, user segmentation, big data crunching building blocks such as funnel analysis, path analysis etc
<br>Advanced, directly customer-impacting data products
<br>existing Intuit products such as personalization and recommendation
<br>new products, leveraging Intuit’s commerce graph, implicit / transaction-based social network, lending, cross-Intuit product recommendation apps etc
<br>Quickly becoming leaders in the data space: data engineering, data science, and data products - internally and externally; contribute to open-source
<br>IDEA is revolutionizing engineering at Intuit, data driven decision making at Intuit, building product at Intuit. We are leading by example and deep partnership with all Intuit product teams including Mint, QuickBooks, TurboTax, SnapTax, and Demandforce.
<br><br><b>Responsibilities</b>
<br>As a member of the Data Engineering and Analytics team you will be building core data capabilities and services for Intuit and you must be passionate about software engineering and data. You should care deeply about writing solid code, you closely follow industry trends and the open source community, you are curious and an avid learner. You like to move fast and get code into production because you know that your work has a positive impact on the lives of end users.
<br>Be an active member of an agile development team
<br>Define, design, implement and test, debug and launch software in a variety of technologies
<br>Lead design discussions
<br>Be a technology and software development thought leader in the organization
<br>Work in a cross-functional team environment
<br>Have fun
<br><br><b>Qualifications</b>
<br>4+ years of experience
<br>Expertise in Object Oriented Software Development
<br>Built and delivered several complex software products
<br>Strong Engineering Leadership Skills
<br>Presenting technical material to technical and non-technical audiences
<br>Making the case for new technology
<br>Leading design discussions
<br>Working cross functionally with colleagues in Operations and QE
<br>Proficient in one or more high-level languages: Java, C++, Scala, Clojure, etc.
<br>Proficient in at least one scripting language: Python, Ruby, Perl, etc.
<br>One or more query languages desired: SQL, Pig, HiveQL, etc.
<br>Distributed computing concepts and practical experience building distributed systems (can range in complexity from simple client/server to MPP systems)
<br>Solid full lifecycle software development experience
<br>Solid functional programming knowledge a plus
<br>Excellent communication skills (oral and written)
<br>BS/MS in CS or equivalent work experience
<br>Imagine a career where your creative inspiration can fuel BIG innovation. Year-over-year, Intuit has been recognized as a best employer and is consistently ranked on Fortune\'s “100 Best Companies To Work For” and Fortune World’s “Most Admired Software Companies” lists. Immerse yourself in our award winning culture while creating breakthrough solutions that simplify the lives of consumers and small businesses and their customers worldwide. Intuit is expanding its social, mobile, and global footprint with a full suite of products and services that are revolutionizing the industry. Utilizing design for delight and lean startup methodologies, our entrepreneurial employees have brought more than 250 innovations to market -- from QuickBooks®, Quicken®, and TurboTax®, to GoPayment, Mint.com, big data, cloud (SaaS, PaaS) and mobile apps. The breadth and depth of these customer-driven innovations mean limitless opportunities for you to turn your ingenious ideas into reality at Intuit. Discover what it’s like to be part of a team that rewards taking risks and trying new things. It’s time to love what you do! Check out all of our career opportunities at: http://jobs.intuit.com/. EOE AA M/F/Vet/ Disability', 
    N'Softare Engineering', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/51617911?trk=jserp_job_details_text');
INSERT INTO Job VALUES (28, N'Symantec', N'
    <b>Qualifications</b>
<br><br>QualificationsDemonstrated passion for quality, innovative approach to solving problems and customer-first attitude are required.
<br>Masters Degree and/or 2-4 years of software development experience
<br>Strong analytical thinking and ability to analyze and optimize existing software applications for purpose of maintenance or redesign.
<br>Demonstrable understanding of UNIX/Windows system components and their interactions a plus, including file systems.
<br>Ability to influence and drive, motivate other software developers.
<br>C/C+/Perl programming as primary skill set.
<br>Storage/Backup/Data protection/Deduplication background is a plus.
<br><br>Symantec is an equal opportunity employer. All candidates for employment will be considered without regard to race, color, religion, sex, national origin, physical or mental disability, veteran status, or any other basis protected by applicable federal, state or local law. ResponsibilitiesThe Software Engineer develops, tests and maintains software modules. Takes active participation as part of a scrum team using agile principles with emphasis on development, unit test, code reviews, component and functional test and maintenance. Collaborates within and across groups if necessary. Must be able to grasp new technologies quickly.
<br>Documentation of code
<br>Refine loosely-defined requirements and continuous stakeholder feedback into demonstrable code
<br>Unit Testing
<br>Feature Development
<br>Product Maintenance
<br>Active participation in Scrum team
<br>Responsible for product quality
<br>Participation in sprint demonstrations with executive and customer stakeholders', 
    N'Software Engineering', N'BS', N'MN', N'https://www.linkedin.com/jobs2/view/55750018?trk=jserp_job_details_text');
INSERT INTO Job VALUES (29, N'Symantec', N'
    <b>Listing Info</b>
<br><br>ResponsibilitiesDepending on account segment, as a Portfolio SE you will participate in development of multi-year account plans and/or multi-year territory plans with the intent of driving deeper adoption of solutions across the Symantec portfolio.
<br><br>The Portfolio SE acts as the SE team lead on projects impacting the overall organization, and as the customer’s (or partner’s) primary point of contact for all technical needs. This role also proactively develops technical relationships at all levels of strategic accounts, ranging from system administrators to senior management. They also actively establish and maintain relationships with local channel partners and establish tight alignment for go-to-market strategies.
<br><br>Your responsibilities include delivering product presentations and performing demonstrations both internally and externally on all products across the Symantec portfolio. Portfolio SEs also coordinate with Marketing and Sales to ensure that Symantec initiatives are timely and appropriate for current end user and/or market demand. Portfolio SEs also require industry knowledge and credibility within the competitive landscape, and must have the ability and confidence to influence customer decisions.
<br><br>Due to the increasingly partner-focused selling expectations for the organization, Portfolio SEs are required to deliver training to partner SEs to continually enable their technical sales force to confidently recommend Symantec solutions to their clients. Additionally, the Portfolio SE is responsible for ensuring partner satisfaction regarding technical aspects of end-user, partner-led initiatives. Finally, Portfolio SEs also act as project lead to ensure that the partner’s specific product requirements are addressed in both current and future product development, and assists both partner and direct sales with building business cases for new opportunities
<br><br><br><b>Key Responsibilities<b>
<br><br>• Build and maintain strong relationships within key focus partner organizations and strategic customer accounts.
<br>• Work collaboratively with sales peers and channel partners to identify opportunities across customer base/territory.
<br>• Invest the appropriate time and resources to partner enablement, training, and shadowing
<br>• Assist both sales peers and channel partners in full sales lifecycle, from solution architecture to implementation
<br>• Map identified customer IT strategies to workable Symantec solution architectures
<br>• Articulate end-to-end solution design, inclusive of consulting, support and education
<br>• Work closely with both focus partners and sales peers to execute assessment-led selling
<br>• Translate customer business requirements into integrated technical solutions
<br>• Solution selling of all Offerings within the Symantec portfolio
<br>• Articulate the ways the Symantec solutions provide increased business value and improved technical capability when compared our competitors.
<br>• Assist in technically closing complex and competitive opportunities through advanced competitive knowledge, technical skills, and credibility
<br>• Deliver product and technology briefings
<br>• Train and mentor TSO peers
<br>• Provide customer solution design which includes 3rd party products
<br>• Technical lead in the development of responses to RFIs and RFPs.
<br>• Assist in the handling of revenue-impacting support escalations
<br><br><br><b>Qualifications</b>
<br><br>• Broad knowledge of the entire Symantec portfolio and relevant competitive solutions Qualifications• Bachelor\'s degree in Computer Science, Engineering or equivalent.
<br>• 8+ years’ experience in systems administration, pre-sales or related field.
<br>• Previous vendor and or pre-sales Systems Engineering experience required.
<br>• Expertise in security solutions and/or enterprise technology or software solutions.
<br>• Have the ability to handle project management responsibilities for implementation of company related solutions assigned by the manager.
<br>• Must possess presentation-ready knowledge of several Symantec or competitor solutions and possess expertise in products making up one or more solutions.
<br>• Ability to present a professional appearance and demeanor.
<br>• Ability to relate to a wide range of technical staff and managers in customer environments.
<br>• Collaborative spirit and excellent written/verbal communicator
<br>• Symantec is an equal opportunity employer. All candidates for employment will be considered without regard to race, color, religion, sex, gender identity, sexual orientation, national origin, physical or mental disability, veteran status, or any other basis protected by applicable federal, state or local law.', 
    N'System Engineering', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/45134422?trk=jserp_job_details_text');
INSERT INTO Job VALUES (30, N'VMware', N'
<b>Job Description:</b> 
<br>VMware Solutions Consultants work very closely with their Global Accounts sales team, which consists of a Global Accounts Manager (GAM), Internal Sales Rep (ISR) and various downstream teams. The Solutions Consultant is a high impact, very visible role responsible for ensuring pervasive enterprise adoption of VMware software and solutions, and closing enterprise transactions within a small number of globally dominant companies. The role is a pre-sales quota carrying role with high visibility within VMware. 
<br><br><b>Requirements:</b> 
<br>* Strong background in technical pre-sales with hands-on experience with OpenStack and Containers required. 
<br>* Ability to collaborate with and motivate multiple groups toward accomplishing a task. 
<br>* Charismatic personality with strong solution selling acumen. 
<br>* Proven track record of selling services as part of a solution. 
<br>* Ability to see and present "the big picture" and offer solutions to make it better. 
<br>* Strong customer-facing and relationship building skills. 
<br>* Experience with enterprise applications, security, systems management, business continuity solutions a plus. 
<br>* Ability to travel up to 60 percent of the time, including international if necessary. 
<br>* BA/BS or equivalent required. 
<br><br><b>Responsibilities:</b> 
<br>* Present VMware value proposition to customers and partners. 
<br>* Understand the customer\'s high-level business challenges globally and locally. 
<br>* Match VMware solutions to customer\'s business and technical requirements. 
<br>* Become a technical advisor within each global account. 
<br>* Sell professional services consistently as part of a total solution. 
<br>* Act as a business analyst to determine which products and services offer solutions that meet customer needs. 
<br>* Research and present reports showing customers the cost benefit of purchasing company products or services. 
<br>* Provide technical training to clients and communicate customer feedback into future product developments. 
<br>* Define and implement a go-to-market strategy for each global account to ensure technical adoption of VMware solutions. 
<br>* Act as a business development liaison --Build and leverage strong OEM and partner relationships. 
<br>* Present VMware vision, strategy and product roadmaps to executives and technical management. 
<br><br>Ideal Candidate will be sitting in NYC Metro Or NJ area 
<br><br><br>Why work with our Group 
<br>The VMware Pre-Sales Engineer (SE) plays a critical role in building and sustaining customer relationships while driving the adoption of VMware solutions to surpassing our revenue goals. The SE works very closely with sales teams to build long-term business relationships within assigned accounts. The SE is a high impact, very visible role responsible for ensuring pervasive enterprise adoption of VMware software and solutions, and closing enterprise transactions within assigned accounts 
<br><br><br>Advertised Location 
<br>New York, NY, US 
<br><br><br>About Us 
<br>VMware is the leader in cloud infrastructure, business mobility and virtualization software. A pioneer in the use of virtualization and policy-driven automation technologies, VMware simplifies IT complexity across the entire data center to the virtual workplace, empowering customers with solutions in the software-defined data center to hybrid cloud computing and the mobile workspace. 
<br>With 2014 revenues of $6.04 billion, VMware has more than 500,000 customers, 75,000 partners, and 18,000+ employees in 120+ locations around the world. At the core of what we do are our employees who deeply value execution, passion, integrity, customers, and community. Want to be part of a compassionate community that thrives on architecting what\'s next in IT? Learn more at vmware.com/careers. 
<br><br><br>EEO Statement 
<br>VMware is an equal opportunity employer committed to the principles of equal employment opportunity and affirmative action for all applicants and employees. Equal opportunity and consideration are afforded to all qualified applicants and employees in personnel actions, which include: recruiting and hiring, selection for training, promotion, rates of pay or other compensation, transfer, discipline, demotion, layoff or termination. VMware does not unlawfully discriminate on the basis of race, color, religion, sexual orientation, marital status, pregnancy, gender identity, gender expression, family medical history or genetic information, citizenship, national origin or ancestry, sex, age, physical or mental disability, medical condition, veteran status, military status, or any other basis protected by federal, state or local law, ordinance or regulation. VMware also makes reasonable accommodations for disabled employees consistent with applicable law. Further, it is the policy of VMware to maintain a working environment free of all forms of harassment.', 
    N'System Engineering', N'BS', N'NY',N'https://www.linkedin.com/jobs2/view/40869647?trk=jserp_job_details_text');
INSERT INTO Job VALUES (32, N'Fiserv', N'
<b>Listing Info</b>
<br><br><b>Job Title</b>
<br>Web Developer
<br><br><b>Job Purpose</b>
<br>Join Us! Fiserv has been named to FORTUNE® magazine’s 2015 list of World’s Most Admired Companies. This is the second consecutive year the company has been named to the list, which is a definitive benchmark of corporate reputation.
<br><br>"Our people are the foundation upon which this recognition is based and I\'m very proud of their commitment to client excellence. Their dedication to serving our clients each day is what makes Fiserv one of the most admired companies in the world." - Jeffery Yabuki, President and Chief Executive Officer
<br><br>About our Business: Bank Solutions delivers technology products and services for community, regional and large financial institutions, whether they process in-house or through an outsourced service center. This group is responsible for product management and development, service delivery and client support related to the Fiserv bank platforms – Premier, Precision, Cleartouch and Signature. Each comprehensive suite helps clients improve customer service and streamline back-office operations by providing mission-critical banking functionality while also serving as a delivery channel for an array of other advanced, value-adding Fiserv solutions.
<br><br>About the Job: The Web Developer will provide advice and consultation with website development and coordinate deployments for Fiserv clients. This role participates in establishing and maintaining the highest quality design generated by the in-house staff and outside consultants to convey brand image.
<br><br><b>Essential Job Responsibilities</b>
<br>Consult with design, technical, marketing staff and internal departments to plan and implement Web solutions.
<br>Conduct needs analysis and project specifications for all design and development projects.
<br>Collaborate with Clients and their external vendors with direction on design projects.
<br>Consult with clients on redesign and enhancements to existing websites to improve the look and feel and drive additional traffic to site.
<br>Coordinate product deployment
<br>Ensure standards are followed during deployment
<br>Update web site content, images, and applications.
<br>Coordinate technical support and maintenance of the web site and associated applications to ensure the highest availability.
<br>Stay abreast of industry trends and all applicable technologies, including scripting, security issues, authoring tools, graphic design tools, and new languages.
<br>Handle client calls and issues.
<br>Train clients on the features and options available.
<br><br><b>Required Qualifications</b>
<br>Bachelor degree in (computer science related, communication, web or graphic design) or minimum of 3 years job related experience
<br>Minimum of 1 year experience in a client-facing role
<br>Significant knowledge in the Web development field, including, but not limited to HTML, CSS, JavaScript, Web Authoring Tools, Graphics Tools and web development methodologies.
<br>Strong communication skills; verbal and written
<br>Experienced in converting concepts and ideas into working prototypes and finished solutions
<br>Ability to apply company policies and procedures to resolve a variety of issues.
<br>Ability to work on problems moderate scope where analysis of situations or data requires a review of a variety of factors.
<br>Ability to exercise judgment within defined procedures and practices to determine appropriate action.
<br><br><b>Preferred Qualifications</b>
<br>Design and build web pages using a variety of graphics software applications, techniques, and tools.
<br>Basic knowledge of the financial industry.
<br><br><b>Thank You For Considering Employment With Fiserv. Please</b>
<br>Apply using your legal name
<br>Complete the step-by-step profile and attach your resume (either is acceptable, both are preferable).
<br><br><br>Fiserv is an Equal Employment Opportunity Employer, and it is the Company’s policy to make all employment decisions without regard to race, color, religion, creed, age, sex, national origin, veteran status, disability (as long as the individual is able to perform the essential functions of the job with or without reasonable accommodation), and any other characteristic protected by Law.', 
    N'Web Development', N'BS', N'WI', N'https://www.linkedin.com/jobs2/view/53824052?trk=jserp_job_details_text');
INSERT INTO Job VALUES (33, N'eBay', N'
    Contributes to the testing with sufficient coverage for one or more product features or sub-systems (example: may be one of three engineers on a sub system like Cart Service, Transaction API, Sign In, etc. ).
<br><br>Spends most of the time coding automation testing. Test code is well-structured, fits into an existing test framework, and typically improves after one or more code reviews.
<br><br>Code is well abstracted, easy to read by a third person, modular, well documented and commented, with good exception handling, stable, fault tolerance, re-startable.
<br><br>Progamming Centric, running and creating test cases in visual studio. experience with vbscript or C#. Load testing with a testing tool such as loadrunner.
<br><br>Participating in and helping shape the overall QA process.
<br><br>Understands customer requirements in assigned area and meets delivery commitments to customer.
<br><br>Creates and prioritizes test cases while keeping different customer segments in mind.
<br><br>Programming Centric, running and creating test cases in visual studio. experience with vbscript or C#. Load testing with a testing tool such as loadrunner.
<br><br>Articulates functional and technical information and requirements in easily understood terms.
<br><br>Can successfully deliver tests against an existing or nonexistent functional or design specification.
<br><br>Learning the tech stack in their area including call sequences to multiple tiers of backend services, event / service sequences, detailed backend database schema and backend SOA call.
<br><br>Can navigate and quickly understand complex code, designs, and systems.
<br><br>Given the broader or long-term test strategy given by more senior team members, implements tests which consider component interactions, compatibility issues, rollout/release requirements, re-use by other systems.
<br><br>Speaks effectively in front of small groups of 5-10.
<br><br>Bachelor’s Degree or equivalent required.
<br>Strong verbal and written communication skills.
<br>Ability to work alongside a variety of personality types.
<br>Progamming Centric, running and creating test cases in visual studio. experience with vbscript or C#. Load testing with a testing tool such as loadrunner.
<br>Experience with agile SDLC a plus.
<br>4+ years of programming in c# with a focus on QA and test automation
<br>Self-starter able to take ownership of tasks without being asked and completing assigned tasks with minimal supervision.', 
    N'Software Engineering', N'BS', N'FL', N'https://www.linkedin.com/jobs2/view/44223833?trk=jserp_job_details_text');
INSERT INTO Job VALUES (34, N'eBay', N'
    Responsible, under general supervision, for moderately complex engineering and/or analytical activities associated with one or more technical areas within the telecom function (such as, but not limited to, network design, engineering, implementation, or operations/user support).
<br><br><b>Specific Duties</b>
<br><br>Work with business units for new IVR initiatives.
<br>Project Updates.
<br>Under minimal supervision responsible for maintenance of the switching equipment.
<br>Has high degree of technical expertise.
<br>Performs routine maintenance on all telecommunications equipment.
<br>Assists in the identification of system/network problems at remote sites. Tests, adjust, and troubleshoot equipment as necessary.
<br>Performs the overall equipment administration for the telecommunications system.
<br>Responsible for the mentoring, coaching, and training of the assigned telecommunications staff.
<br>Coordinates the progress of projects related to changes, upgrades, programming requests, and expansion of the telecommunications equipment and network.
<br>Make capacity recommendations to management by monitoring the performance of the telecommunications network and equipment.
<br>Responds to the issues that come up daily on the function of the company\'s telecommunications equipment; tracks inventory.
<br>Works with vendor on projects related to the telecommunications network and equipment.
<br>Reports equipment/network problems to our vendors and tracks their responses through to resolution.
<br>Supplies documentation regarding the function, performance, traffic, or administration of the telecommunications equipment.
<br>Processes purchase orders for equipment needed for expansion.
<br>Evaluates new software and hardware products.
<br>Responsible for the following: VXML development, ACD programming and vectoring, Tier 3 troubleshooting, Network architecture design, CTI architecture design recommendation and implementation, and Capacity/facilities planning to include CPU/port utilization - upgrade paths, and site facility planning for voice/video.
<br>Other duties as assigned.
<br><br><b>C. Knowledge, Skills, and Abilities</b>
<br><br>Excellent organizational, communication, and interpersonal skills.
<br>Excellent written and oral communication.
<br>Knowledge of ACH, Credit Card, Debit Card and Banking Operations.
<br>Ability to direct and motivate others.
<br>Unwavering attention to detail.
<br>Well-developed sense of urgency and follow through.
<br>Ability to work flexible hours.
<br>Ability to handle multiple projects under pressure.
<br>Must be a team player willing to support and accept the total quality processes and systems.
<br>Internet savvy, problem-solving abilities, analytical.
<br>Must also have the ability to work independently, also have the ability to report to a variety of project managers and superiors.
<br>Meet or exceed all published standards measured monthly and YTD
<br>Maintain acceptable level of job discretion. Performance is evaluated against the ability to make judgment calls, the ability to make sound decision, a desire to make decisions, displaying a heightened level of accountability, demonstrating a sense of responsibility, confidentiality and professionalism.
<br>Maintain acceptable level of teamwork by incorporating a positive attitude, being supportive in words and actions, embodying the core values of PayPal, and communicating with all levels both within the existing team & anyone outside the direct reporting structure.
<br>Maintain acceptable level of commitment which includes more than just showing up for work, more than just performing expectations, seeking out additional responsibilities (not OT), volunteering for special projects, identifying oneself as a go-to individual, flexibility with change and a passion for the product and company.
<br><br><b>A. Education</b>
<br><br>Associates Degree or certification in Telecommunications, Data Networking, Development Languages or general IT Systems
<br><br><b>B. Experience</b>
<br><br>Four to six years of progressively responsible telecommunications work for a large company is required
<br>Knowledge of VOIP, SIP and general data networks as they pertain to the voice environment
<br>Successful completion of the formal training for Avaya ACD (and peripherals), Cisco ICM, Aspect Dialer , Genesys/ICM and various IVR platforms is preferred.
<br>Experience in the monitoring, tracking, and configuration of PBX and voice equipment, along with carrier and LEC coordination/delivery.
<br>Experience in a customer-focused technical-support environment.
<br>&bull; Some global or international experience preferred.
<br>&bull; Possesses deep financial and analytical skills with attention to detail.
<br>&bull; BackOffice operations experience a plus.
<br>Capable of understanding the strategic direction of the company. Understands business drivers and strategy.
<br>Demonstrates strong oral and written communication skills. Exhibits confidence and credibility during presentations.
<br>Thrives in fast changing competitive environment.
<br>Self-driven and be able to work with minimal supervision.', 
    N'Telecom Engineering', N'BS', N'UT', N'https://www.linkedin.com/jobs2/view/41654755?trk=jserp_job_details_text');
INSERT INTO Job VALUES (35, N'LinkedIn', N'LinkedIn was built to help professionals achieve more in their careers, and every day millions of people use our products to make connections, discover opportunities, and gain insights. Our global reach means we get to make a direct impact on the world’s workforce in ways no other company can. We’re much more than a digital resume – we transform lives through innovative products and technology.
<br><br>Searching for your dream job? At LinkedIn, we strive to help our employees find passion and purpose. Join us in changing the way the world works.
<br><br>As part of our world-class software engineering team, you will be charged with building the next-generation infrastructure platforms for LinkedIn — including but not limited to: an application and service delivery platform, massively scalable data storage and replication systems, and a cutting-edge search platform. You will work and learn among the best, putting to use your experience in distributed technologies and algorithms, your great API and systems-design sensibilities, and your passion for writing code that performs at an extreme scale. LinkedIn has already pioneered well-known open-source data infrastructure projects like Voldemort, Kafka, and Azkaban – come join our Data team and share the knowledge with a broader community while making a real impact within our company.
<br><br><b>Responsibilities:</b>
<br><br>The ideal candidate will help scale LinkedIn’s infrastructure to handle massive growth in membership, traffic, and data as we continue to experience dramatic growth in the usage of our products with focus in one or more of the areas below:
<br>Data Infrastructure: A focus on building and supporting large scale systems and tools that enable the generation of insights and data products on all of LinkedIn’s internal and external data via self-serve computing, reporting solutions, and interactive querying.
<br>Search, Networks and Analytics: Build and operate the platform that powers all of search at LinkedIn—responding to thousands of queries per second with target latencies in tens of milliseconds. The goal is to provide and run in 24/7 production environment a platform that enables search quality engineers to rapidly innovate, experiment and improve relevance—while at the same time remaining constantly available and performant to our users.
<br>Service: Provide the technical platform for all of LinkedIn Engineering to build services, which are the essential unit of development and deployment.
<br>Content and Community: Deliver the systems and algorithms that generate and serve feeds of professionally relevant activities and content.
<br><br><b>Basic Qualifications:</b>
<br><br>B.S. or higher in Computer Science or related technical discipline, or related practical experience.
<br>Demonstrated knowledge and experience with object-oriented programming languages.
<br><br><b>Preferred Qualifications:</b>
<br><br>Experience building distributed, Internet-scale systems.
<br>Experience building and applying frameworks for one or more of the following: caching, queuing, RPC, parallelism, and/or distributed knowledge.
<br>Thorough knowledge of multi-threading, concurrency, and parallel processing technologies.
<br>Experience with industry, open-source projects and/or academic research in large-data, parallel and distributed systems.
<br>Published work in academic conferences or industry circles.', 
    N'Software Engineering', N'BS', N'CA', N'https://www.linkedin.com/jobs2/view/44205713?trk=jserp_job_details_text');

INSERT INTO Skillset VALUES (N'C++');
INSERT INTO Skillset VALUES (N'C');
INSERT INTO Skillset VALUES (N'Java');
INSERT INTO Skillset VALUES (N'Python');
INSERT INTO Skillset VALUES (N'PHP');
INSERT INTO Skillset VALUES (N'Ruby');
INSERT INTO Skillset VALUES (N'Perl');
INSERT INTO Skillset VALUES (N'Matlab');
INSERT INTO Skillset VALUES (N'R');
INSERT INTO Skillset VALUES (N'Excel');
INSERT INTO Skillset VALUES (N'Linux');
INSERT INTO Skillset VALUES (N'Swift');
INSERT INTO Skillset VALUES (N'Shell');
INSERT INTO Skillset VALUES (N'SQL');
INSERT INTO Skillset VALUES (N'C#');
INSERT INTO Skillset VALUES (N'Hack');
INSERT INTO Skillset VALUES (N'WCF');
INSERT INTO Skillset VALUES (N'.NET');
INSERT INTO Skillset VALUES (N'iOS');
INSERT INTO Skillset VALUES (N'Mac OS X');
INSERT INTO Skillset VALUES (N'VLSI');
INSERT INTO Skillset VALUES (N'Objective-C');
INSERT INTO Skillset VALUES (N'Scala');
INSERT INTO Skillset VALUES (N'Hadoop');
INSERT INTO Skillset VALUES (N'OS');
INSERT INTO Skillset VALUES (N'J2EE');
INSERT INTO Skillset VALUES (N'HTML');
INSERT INTO Skillset VALUES (N'css');
INSERT INTO Skillset VALUES (N'JavaScript');
INSERT INTO Skillset VALUES (N'VXML');

INSERT INTO RequireSkill VALUES (1, N'C');
INSERT INTO RequireSkill VALUES (1, N'Python');
INSERT INTO RequireSkill VALUES (1, N'Swift');
INSERT INTO RequireSkill VALUES (2, N'C');
INSERT INTO RequireSkill VALUES (3, N'C');
INSERT INTO RequireSkill VALUES (3, N'C++');
INSERT INTO RequireSkill VALUES (3, N'Java');
INSERT INTO RequireSkill VALUES (3, N'Python');
INSERT INTO RequireSkill VALUES (3, N'Perl');
INSERT INTO RequireSkill VALUES (3, N'Shell');
INSERT INTO RequireSkill VALUES (4, N'C');
INSERT INTO RequireSkill VALUES (4, N'C++');
INSERT INTO RequireSkill VALUES (4, N'Java');
INSERT INTO RequireSkill VALUES (4, N'Python');
INSERT INTO RequireSkill VALUES (5, N'SQL');
INSERT INTO RequireSkill VALUES (6, N'Python');
INSERT INTO RequireSkill VALUES (6, N'PHP');
INSERT INTO RequireSkill VALUES (6, N'Ruby');
INSERT INTO RequireSkill VALUES (6, N'Perl');
INSERT INTO RequireSkill VALUES (6, N'C');
INSERT INTO RequireSkill VALUES (6, N'C++');
INSERT INTO RequireSkill VALUES (6, N'Java');
INSERT INTO RequireSkill VALUES (6, N'Linux');
INSERT INTO RequireSkill VALUES (7, N'C');
INSERT INTO RequireSkill VALUES (7, N'C++');
INSERT INTO RequireSkill VALUES (7, N'C#');
INSERT INTO RequireSkill VALUES (7, N'Java');
INSERT INTO RequireSkill VALUES (7, N'Perl');
INSERT INTO RequireSkill VALUES (7, N'PHP');
INSERT INTO RequireSkill VALUES (7, N'Hack');
INSERT INTO RequireSkill VALUES (7, N'Python');
INSERT INTO RequireSkill VALUES (8, N'C#');
INSERT INTO RequireSkill VALUES (8, N'WTF');
INSERT INTO RequireSkill VALUES (8, N'.NET');
INSERT INTO RequireSkill VALUES (8, N'SQL');
INSERT INTO RequireSkill VALUES (9, N'C');
INSERT INTO RequireSkill VALUES (9, N'C++');
INSERT INTO RequireSkill VALUES (9, N'Java');
INSERT INTO RequireSkill VALUES (9, N'SQL');
INSERT INTO RequireSkill VALUES (9, N'Python');
INSERT INTO RequireSkill VALUES (9, N'Perl');
INSERT INTO RequireSkill VALUES (9, N'R');
INSERT INTO RequireSkill VALUES (9, N'Matlab');
INSERT INTO RequireSkill VALUES (10, N'SQL');
INSERT INTO RequireSkill VALUES (11, N'Perl');
INSERT INTO RequireSkill VALUES (11, N'Linux');
INSERT INTO RequireSkill VALUES (13, N'C');
INSERT INTO RequireSkill VALUES (13, N'C++');
INSERT INTO RequireSkill VALUES (14, N'C');
INSERT INTO RequireSkill VALUES (14, N'Java');
INSERT INTO RequireSkill VALUES (15, N'R');
INSERT INTO RequireSkill VALUES (15, N'Python');
INSERT INTO RequireSkill VALUES (15, N'Ruby');
INSERT INTO RequireSkill VALUES (15, N'SQL');
INSERT INTO RequireSkill VALUES (15, N'Matlab');
INSERT INTO RequireSkill VALUES (16, N'C');
INSERT INTO RequireSkill VALUES (16, N'Mac OS X');
INSERT INTO RequireSkill VALUES (16, N'iOS');
INSERT INTO RequireSkill VALUES (17, N'C');
INSERT INTO RequireSkill VALUES (17, N'C++');
INSERT INTO RequireSkill VALUES (17, N'VLSI');
INSERT INTO RequireSkill VALUES (18, N'Java');
INSERT INTO RequireSkill VALUES (18, N'SQL');
INSERT INTO RequireSkill VALUES (19, N'C');
INSERT INTO RequireSkill VALUES (19, N'iOS');
INSERT INTO RequireSkill VALUES (20, N'Java');
INSERT INTO RequireSkill VALUES (21, N'Objective-C');
INSERT INTO RequireSkill VALUES (22, N'SQL');
INSERT INTO RequireSkill VALUES (22, N'Hadoop');
INSERT INTO RequireSkill VALUES (22, N'Scala');
INSERT INTO RequireSkill VALUES (23, N'iOS');
INSERT INTO RequireSkill VALUES (25, N'OS');
INSERT INTO RequireSkill VALUES (26, N'C');
INSERT INTO RequireSkill VALUES (26, N'C++');
INSERT INTO RequireSkill VALUES (27, N'Java');
INSERT INTO RequireSkill VALUES (27, N'C++');
INSERT INTO RequireSkill VALUES (27, N'Scala');
INSERT INTO RequireSkill VALUES (27, N'Python');
INSERT INTO RequireSkill VALUES (27, N'Ruby');
INSERT INTO RequireSkill VALUES (27, N'Perl');
INSERT INTO RequireSkill VALUES (27, N'SQL');
INSERT INTO RequireSkill VALUES (28, N'C');
INSERT INTO RequireSkill VALUES (28, N'C++');
INSERT INTO RequireSkill VALUES (28, N'Perl');
INSERT INTO RequireSkill VALUES (31, N'Java');
INSERT INTO RequireSkill VALUES (31, N'SQL');
INSERT INTO RequireSkill VALUES (31, N'J2EE');
INSERT INTO RequireSkill VALUES (32, N'HTML');
INSERT INTO RequireSkill VALUES (32, N'css');
INSERT INTO RequireSkill VALUES (32, N'JavaScript');
INSERT INTO RequireSkill VALUES (33, N'C#');
INSERT INTO RequireSkill VALUES (33, N'JavaScript');
INSERT INTO RequireSkill VALUES (34, N'VXML');

INSERT INTO User VALUES (N'li206', N'Yanwen', N'Li', N'408-784-8107', N'li206@illinois.edu', N'Computer Science', N'1903 N Lincoln Ave', N'Urbana', N'IL', N'1234');
INSERT INTO User(NetID, FirstName, LastName, Email, Major, City, State, Password) VALUES (N'cyuan10', N'Chufeng', N'Yuan', N'cyuan10@illinois.edu', N'Computer Science', N'Urbana', N'IL', N'1234');
INSERT INTO User(NetID, FirstName, LastName, Email, Major, City, State, Password) VALUES (N'whuo3', N'Weijie', N'Huo', N'whuo3@illinois.edu', N'Computer Science', N'Urbana', N'IL', N'1234');
INSERT INTO User(NetID, FirstName, LastName, Email, Major, City, State, Password) VALUES (N'edwardwh', N'Hao', N'Wang', N'edwardwh@illinois.edu', N'Computer Science', N'Urbana', N'IL', N'1234');

INSERT INTO HaveSkill VALUES (N'li206', N'C');
INSERT INTO HaveSkill VALUES (N'li206', N'Java');
INSERT INTO HaveSkill VALUES (N'li206', N'Python');
INSERT INTO HaveSkill VALUES (N'li206', N'SQL');
INSERT INTO HaveSkill VALUES (N'li206', N'Excel');
INSERT INTO HaveSkill VALUES (N'whuo3', N'C');
INSERT INTO HaveSkill VALUES (N'whuo3', N'C++');
INSERT INTO HaveSkill VALUES (N'whuo3', N'Java');
INSERT INTO HaveSkill VALUES (N'whuo3', N'Python');
INSERT INTO HaveSkill VALUES (N'whuo3', N'SQL');
INSERT INTO HaveSkill VALUES (N'edwardwh', N'C');
INSERT INTO HaveSkill VALUES (N'edwardwh', N'Java');
INSERT INTO HaveSkill VALUES (N'edwardwh', N'SQL');
INSERT INTO HaveSkill VALUES (N'cyuan10', N'C++');
INSERT INTO HaveSkill VALUES (N'cyuan10', N'Java');
INSERT INTO HaveSkill VALUES (N'cyuan10', N'SQL');

INSERT INTO InterviewQuestion VALUES (N'Apple', N'There are three boxes, one contains only apples, one contains only oranges, and one contains both apples and oranges. The boxes have been incorrectly labeled such that no label identifies the actual contents of the box it labels. Opening just one box, and without looking in the box, you take out one piece of fruit. By looking at the fruit, how can you immediately label all of the boxes correctly? ');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'You have a 100 coins laying flat on a table, each with a head side and a tail side. 10 of them are heads up, 90 are tails up. You can\'t feel, see or in any other way find out which side is up. Split the coins into two piles such that there are the same number of heads in each pile.');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'Find number of ones in an integer.');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'In a stream of integers from 1 to n, only one number will be repeated. How can you tell what that number is?');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'The unexpected question was about reversing a singly linked list with the given prototype. But I was the one to be blamed as I wasn\'t well prepared.');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'If you have a program that runs slow, how will you improve it to run faster? ');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'Given the following struct how much memory is require to   store it in a 32-bit and 64-bit system? struct A { char t; char *t; } ');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'Write a routine to determine if a linked list has a cycle. ');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'Print out, from small to big, of a sequence intergers   , without sorting. ');
INSERT INTO InterviewQuestion VALUES (N'Apple', N'If you and a large brick are in a boat floating in a pool   , will the water level rise or fall when the brick is tossed into the water? What if the brick is a large piece of Styrofoam and thrown into the water? ');
INSERT INTO InterviewQuestion VALUES (N'Google', N'How many cows are in Canada?');
INSERT INTO InterviewQuestion VALUES (N'Google', N'How many people using facebook in San Francisco at 2:30pm   on a Friday? ');
INSERT INTO InterviewQuestion VALUES (N'Google', N'25 horses, 5 race tracks. How many races you have to run to   select top 5 horses. ');
INSERT INTO InterviewQuestion VALUES (N'Google', N'Given the list of points of the skyline of a city in order   (from East to West) Find the maximal rectangle contained in this skyline.');
INSERT INTO InterviewQuestion VALUES (N'Google', N'Find a sequence with max sum in an array of negative and positive real numbers.');
INSERT INTO InterviewQuestion VALUES (N'Google', N'You have a sequence where each number is a multiple of 2 or   5 (so: 2^i * 5^j). he gave the beginning of the sequence as 1,2,3,4,5,8,10,16... and asked me to find an algorithm to calculate the next number in the sequence. ');
INSERT INTO InterviewQuestion VALUES (N'Google', N'Given the daily values of a stock, find how you can lose the most with one buy-sell trading.');
INSERT INTO InterviewQuestion VALUES (N'Google', N'Given an array of numbers, replace each number with the product of all the numbers in the array except the number itself *without* using division.');
INSERT INTO InterviewQuestion VALUES (N'Google', N'You have all of the prices for a given stock for the next year. You can buy once and sell once in that year. How do you determine when to buy and sell to maximize your profit?');
INSERT INTO InterviewQuestion VALUES (N'Google', N'How would you determine if someone has won a game of tic-tac-toe on a board of any size?');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'You have two lightbulbs and a 100-storey building. You want to find the floor at which the bulbs will break when dropped. Find the floor using the least number of drops.');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'You\'re about to get on a plane to Seattle. You want to know   if you should bring an umbrella. You call 3 random friends of yours who live there and ask each independently if it\'s raining. Each of your friends has a 2/3 chance of telling you the truth and a 1/3 chance of messing with you by lying. All 3 friends tell you that "Yes" it is raining. What is the probability that it\'s actually raining in Seattle? ');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Implement a function rotateArray(vector<int> arr, int   r) which rotates the array by r places. Eg 1 2 3 4 5 on being rotated by 2 gives 4 5 1 2 3. ');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Given a list of n objects, write a function that outputs the minimum set of numbers that sum to at least K. FOLLOW UP: can you beat O(n ln n)?');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'You are trying to rob houses on a street. Each house has   some +ve amount of cash. Your goal is to rob houses such that you maximize the total robbed amount. The constraint is once you rob a house you cannot rob a house adjascent to that house.');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Implement a function string balanceParanthesis(string s   ); which given a string s consisting of some parenthesis returns a string s1 in which parenthesis are balanced and differences between s and s1 are minimum. Eg - "(ab(xy)u)2)" -> "(ab(xy)u)2" ")))(((" -> "" ');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Function to compute the number of ways to climb a flight of   n steps. Taking 1, 2, or 3 steps at a time. Do it in Linear time and constant space. n = 3. 1 1 1 1 2 2 1 3 Ans = 4 ');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Given an array of integers, now we want to erase all 0\'s (can be other value), and we want the result array condensed, meaning no empty cell in the array.');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Find the minimum depth of binary search tree');
INSERT INTO InterviewQuestion VALUES (N'Facebook', N'Write some pseudo code to raise a number to a power.');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Describe a routine which returns the set of integers in {1..100} divisible without remainder by 3 but not by 9.');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Find the second largest element in a Binary Search Tree');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Find median of an infinite stream of integers in O(1) time');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Java: how do you make n threads run at the same time?');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Given a sorted list of integers, an arbitrary split is made   such that the end of the first list is appended to the first, i.e.: 1 2 3 4 5 6 7 8 becomes: 6 7 8 1 2 3 4 5 Find the index of a number N in the array, returning -1 if it does not exist. ');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Validate if given string is a number.');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Traverse a binary there so that the order returned is ordered from smallest to greatest.');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Consider an X x Y array of 1\'s and 0s. The X axis   represents "influences" meaning that X influences Y. So, for example, if $array[3,7] is 1 that means that 3 influences 7. An "influencer" is someone who influences every other person, but is not influenced by any other member. Given such an array, write a function to determine whether or not an "influencer" exists in the array. ');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'How would you measure the weight of the earth?');
INSERT INTO InterviewQuestion VALUES (N'LinkedIn', N'Print a tree level by level');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Devise a way to make sure there is always mlik in my fridge.');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Given a set of numbers -50 to 50, find all pairs that add   up to a certain sum that is passed in. What\'s the O notation for what you just wrote? Can you make it faster? Can you find an O(n) solution? Implement the O(n) solution');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Determine if an array from 1..n has a duplicate in constant time and space.');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'You are on a game show. There are three doors, behind one   of which is a prize and the other two is a chunk of coal, and the host knows which door holds the prize. You choose door #1. Before it is opened, the host opens door #3 and reveals a lump of coal. You have the choice to stick with the door you chose originally or switch to door #2. What do you do? ');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'You are on a desert island, and all you have is a pair of   dice. You know that a plane flies over the island on the 30th day of the month. Using the dice, how can you make a calendar that always tells you the day of the month? ');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Given an array with length n-1 which contains integers of   the range 1 to n. Each element is distinct and appears only once. One integer is missing. Find the missing integer in linear time using O(1) memory. Now two integers are missing, find them out in linear time using O(1) memory. How about three?');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Why is a manhole cover round?');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'How could you represent days and month using two 6 sided dice”');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Implement a stack using two queues.');
INSERT INTO InterviewQuestion VALUES (N'Microsoft', N'Pancakes, size varies, and are put in a stack with random   order. You have one operation called Flip(int[] pancakes, int k) to flip all pancakes from the top one to kth pancake, write a sort(int[] pancakes]) method ');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'If you had 5,623 participants in a tournament, how many games would need to be played to determine the winner');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Write an algorithm to determine if 2 linked lists intersect');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Find the deepest common ancestor of two nodes in a tree structure.');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Number of 1\'s in binary representation of integer?');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Most of them were expected. Almost all are problem solving   questions. 1. Given a BST with following property find the LCA of two given nodes. Property : All children has information about their parents but the parents do not have information about their children nodes. Constraint - no additional space can be used');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Write an algorithm to determine whether a given number is of the form (2^n)+1, where n is an integer.');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Implement a function to validate whether a given binary tree is a BST (i.e. write an isBST() function).');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Traverse nodes in a binary tree');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Given a string find the first non-repeated character.');
INSERT INTO InterviewQuestion VALUES (N'Amazon', N'Determine whether the binary representation of a number if a palindrome or not, code it on a white board.');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'You have 8 pennies, 7 weight the same, one weighs less. you also have a judges scale. Find the one that weighs less in less than 3 steps.');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'Simplify a\'b+abc+bc\'');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'in a boat on a lake with a rock, throw the rock in the water which way does the water level move? here is a memory card- what is it made out of and how was it made?');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'A batch of wafers are getting cleaned in acid, aqueous and   drying environments and a technician calls you in the middle of the night reporting that the wafers are having an unusual number of defects. How do solve the problem and what advice do you give the technician? ');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'What is the net charge of a plasma?');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'At what rotational speed do turbopumps operate?');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'How does A/R and inventory fluctuations affect the income statement?');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'Array reverse without using iteration. Code in C.');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'There are 25 Netware workstations on a rack, attached to one Netware server. You can only get 20 to see the network at a time. What steps do you take to troubleshoot this?');
INSERT INTO InterviewQuestion VALUES (N'Intel', N'CMOS Inverter , how to reduce the drive strength of Minimum size inverter');
INSERT INTO InterviewQuestion VALUES (N'HP', N'If you have two devices that can interrupt your program and   you want to give priority and atomicity to one of the processes over the other, but you cannot use a semaphore or mutex, how would you do it? ');
INSERT INTO InterviewQuestion VALUES (N'HP', N'The I-V characteristic and five regions of MOS operation.');
INSERT INTO InterviewQuestion VALUES (N'HP', N'A logical math problem involving a rowboat, a lake, and a lion that can go 3x as fast as the boat. The question was whether or not I could make it to the shore.');
INSERT INTO InterviewQuestion VALUES (N'HP', N'what is the stub you designed and how it was solution');
INSERT INTO InterviewQuestion VALUES (N'HP', N'A user calls and complains that the E-mail he/she is sending does not get to the intended receipients. What steps do you take to investigate and resolve?');
INSERT INTO InterviewQuestion VALUES (N'HP', N'How would you turn a 2:1 MUX into an AND gate?');
INSERT INTO InterviewQuestion VALUES (N'HP', N'There are two rooms - one has three light bulbs, the other has three switches. You can go to the room with the bulbs ones. How will you find out which switch turns on which light bulb.');
INSERT INTO InterviewQuestion VALUES (N'HP', N'-print fibanncci number 0-1000 -write atoi() -why are man   hole cover round -three people, average salary without telling anybody your salary');
INSERT INTO InterviewQuestion VALUES (N'HP', N'Describe how you would implement a palindrome finder for an arbitrary length word');
INSERT INTO InterviewQuestion VALUES (N'HP', N'Work out an algorithm for printing out the individual characters to show the decimal representation of an arbitrary integer.');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'There are eight silver coins and one counterfeit coin. that   looks like a silver coin but actually weighs slightly less than the others. By using a balance scale to compare coins (or groups of coins) whats the minimum number of times you have to use the scale to guarantee that you find the lightest coin? Explain your answer ');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'What is sysprep, and how is it used in an everyday computer enviornment?');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'Which is better: RAID 0+1 or RAID 1+0?');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'What is your experience with computer software and information technology?');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'Describe a project I had in school and what were my roles in the group');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'how do you configure key figures in SAP APO');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'Pick a difficult project you\'ve had in the past, explain it to me, tell me what your approach was to solve it and how did it turn out');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'If given offers between BCG/Bain/IBM, where would your heart lie?');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'What is the most efficient sorting algorithm? What is its runtime?');
INSERT INTO InterviewQuestion VALUES (N'IBM', N'How do you check if a number is odd or even?');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'If you have three 200GB drives, what is the total capacity for storage?');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Why are manhole covers round?');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'In order of priority what are most important aspects- people, processes, communications');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Describe a scenario where your personal ethics had to be compromised to meet a company objective.');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Describe a situation where you need a computer to speak to two different connections on the same system on two separate networks.');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Describe classloader');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'What does POST mean?');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Suppose you are writing a test script to test a function running in a process over night. How do you make sure that if the process is halted, your test function will be able to detect that.');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Display all values of a BST from low to high order');
INSERT INTO InterviewQuestion VALUES (N'DELL', N'Flip the order of a Single linked list');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'Considering a 2-dimension matrix that can only be traversed   by 1 adjacent position at a time and never diagonally. Create an algorithm to traverse that matrix from its upper-left corner to its lower-right corner using the shorter possible path in the most efficient way.');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'Two people are each stuck on their own island, connected by   a ferryman with a lockable box. Each person has their own lock and key, but can\'t send the key along with the box. One person wants to send the other a diamond, but it must be placed into the box and locked or it will be stolen by the ferryman. How do you send the diamond without the ferryman stealing it? ');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'A key is broken on your laptop keyboard. How do you work around it until you can get a new keyboard?');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'5 horses on a 5-lane track. You have 5 horses and you want   to rank the top three. All you have available to you is a track and the ability to tell perfectly in which order the horses crossed the finish line. How many races are necessary in order to rank the top three horses?');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'Questions like what is the Super class of all classes in JAVA. How does the class loader work. What are the different drivers in JDBC?');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'How does a B+ tree index work?');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'how to find result of last executed command on linux');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'Setup time hold time violation definition, solutions... How would two closely placed wires interfere each other.”');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'What is a trigger in a database?');
INSERT INTO InterviewQuestion VALUES (N'ORACLE', N'How do you configure subledger, etax');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'Division method without using divide operator');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'convert the result of 7^n (7 to the Nth) to string');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'find lowest common ancestor of 2 nodes in a binary tree');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'given a matrix where the numbers ascend both in rows   & columns, e.g. 1 3 5 7 9 11 13 15 18 20 22 24 26 28 30 31 33 36 38 39 42 44 47 49 50 If you\'re asked to write a function that provides a boolean (YES or NO) answer to "does this number exist in this matrix", explain how you would design an algorithm to be most optimal.');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'can you host multiple https sites with different domain names but same IP on the same server? how');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'how to detect cycle in linked list');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'Add two numbers in 2 operations');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'What is IIS');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'What is the difference between a signed and unsigned integer variable type?');
INSERT INTO InterviewQuestion VALUES (N'Symantec', N'Design a stack implementation that has "push", "pop" and   "peek" functions (look at the top-most value of the stack without popping it off the stack), and then design a function that tells the caller what the "minimum" value in the stack will be.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'How many race heats are needed to find the 3 fastest   pinewood derby cars out of a field of 8, if only 4 cars can run at a time (assuming that every car will always run the way/speed and each lane is exactly equivalent)?');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Given a series of strings, find the biggest common prefix.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'How do you reverse print a string. After answering the same   by providing an out of the box API, the next unexpected question was "What if it does NOT exist". While and 2nd alternative was provided, it was pretty much shot down as being not acceptable.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'You are given a dictionary, such as /usr/share/dict/words   , containing a list of words, one per line. You are also given seven tiles. Each tile is either blank or contains a single lowercase letter (a-z). List all of the words from the dictionary that can be produced by using some or all of the seven tiles, in any order. A blank tile is a wildcard, and can be used in place of any letter. Try to use a minimal amount of memory. 1. Find all of the words that can be formed if you don\'t have to deal with blank tiles. (You may skip this step and go straight to step 2). 2. Find all of the words that can be formed, including those where blank tiles are used as wildcards. 3. Would you do things differently if you had to process several hundred tile sets with the same dictionary? ');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Explain x86 calling convention');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Draw on whiteboard a box presenting a system, a few inputs   and a few outputs. Possible two ways of implementing the box: one is to multithread per input, one is to multithread by functions/modules, and run fixed # of threads per function/module and process inputs in a pipeline fashion. Compare the pros and cons of these two implementations.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Given many points on a coordinate plane, find the pair of points that is the closest among all pairs of points.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Your machine stops recording error logs and it crashed how will you troubleshoot?');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'Given a string containing only English character, find the first unique character in the string, upper and lower cases should not be treated as the same character.');
INSERT INTO InterviewQuestion VALUES (N'VMware', N'troubleshooting a small network, describing RAID levels');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'Name all the FSMO roles for Active Directory.');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'Tell me when you should communicate via e-mail vs. in-person communication.');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'What software design patterns do you know?');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'Tell me the difference between the start up steps of Windows and the startup steps of linux.');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'How are directories in Linux different from directories in Windows');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'what is the difference between linear regression and logistic regression?');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'How do you feel about telecommuting?');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'Tell me something you disliked about a previous employer');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'Tell me about a time when a policy was changed at work and how did you handle the change.');
INSERT INTO InterviewQuestion VALUES (N'Fiserv', N'How do you handle unhappy clients');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Difference between c++ and java?');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'How will you make this code readable (given a piece of code)');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Suppose you have an interface in which certain aspects of the implementation could be defined and those would carry over to classes implementing it- when do you think that would be useful?');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Tell me about a time when you completed a project but it wasn\'t up to par. How did you remedy it? (asked for 3 separate examples)');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'You have two strings, each of which burns in exactly one hour, although not at a constant rate. How do you measure 45 minutes with only these two strings?');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Remove an item from a singly linked list. Next: do it with no additional memory usage');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'pseudo code to check if a string is a palindrome');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Tell us about a time when you wanted to make a change, what did you do and were you successful? Tell us about a time when you realized you should have asked for help sooner?”');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'You have a list of 100, 000 elements. Your mobile device has a RAM to store 10,000 elements. You have to sort 100,000 elements in the RAM. How would you do it.');
INSERT INTO InterviewQuestion VALUES (N'Intuit', N'Given a string, how do you find a list of anagrams from a english dictionary (or just the dict file in unix)?');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Find the first index of the substring. Condition: Do not   use java library function or regular expressions. And measure the performance of your implementation with the standard java library function. Examples: String 1: “abcdefg” String 2: “bcd” Should return 1 String 1: “abcdefg” String 2: “x” Should return -1');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'How to find a special weight ball from 8 balls while other 7 have the same weight with a balance? (all same color, shape etc.) Trick is that you don\'t know if the special ball is lighter or heavier.');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Give an array of Integer which contain duplicate number from 1-100, how to count how many distinct number you have?');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'what\'s the difference between an abstract class and an interface. Can a class inherit both from an abstract class and an interface at the same time?');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'How to reverse a String? How to deal with it if the input string is null?');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Fastest way to find the middle node in a linked list');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'How to reverse a Linklist');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Given 999 distinct numbers between 1 and 1000, find one/two that is/are missing.');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Describe the agile methodology of project management and how your last project ended up with this practice.');
INSERT INTO InterviewQuestion VALUES (N'Salesforce.com', N'Reverse an array, and write test cases for   it. Onsite: 1. How to test twitter posting? 2. Programming test 2 methods: reverse a string and compare 2 strings. Write test cases for both methods. 3. Manager Interview 4. Revers a circled linked list. ');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'What data structure would you use for a browser\'s BACK & FORWARD ability');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'You have a list of numbers from 1-1000, each number only exists once and they are in random order. You randomly take one out. How do you know which is the missing number?');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'Assuming a preexisting list of 100 words, how would you efficiently see if a word received from input is an anagram of any of the 100 words?');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'Given a rand5() function which   provide a random number between 1-5 at equal probability. Write a rand7() fuction to provide a random number between 1-7 with equal probability');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'You are given a predefined function which generates random   number from 1 to 5. You need to use this function and create another function which will generate random number from 1 to 7. Now most important thing is to remember that new random function should be even (i.e. the number generated should be unpredictable, and evenly spaced out).');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'How to retrieve a file with a specific string or keyword using UNIX command line');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'How would you pick the middle element of a list');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'You have five bottles with pills. One bottle has 9 gram   pills, the others have 10 gram pills. You have a scale that can only be used once. How can you find out which bottle contains the 9 gram pills?');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'Write code to do the reverse mapping from phone number to   its all possible combination of letters. Ex- if dialed 12 then all possible combinations will be ad, ae, af, bd, be, bf, cd, ce, cf and so on... ');
INSERT INTO InterviewQuestion VALUES (N'eBay', N'Using the characters on a telephone dial, give all the permutation of strings for given digits');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Given a   string "Keyword" find whether the characters exist in a String "Target" in the same order but not necessarily next to each other Keyword cat aaa Target cbate abcde Output YES NO ');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Design a data structure to store sparse 2D matrix which contains only 0 or 1. then write function to add 2 such matrix.');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Write a function given x, the function returns the xth number in the Fibonacci sequence.');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'How do you switch values of variables A and B without using a third variable for storage?');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'What is the most efficient way to swap the numbers from   left to right? For example: 1234567 if giving the k = 3, the result should be 4567123. ');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'You are given a database table that keeps track of student data. The fields contain id, name, major, current year. How would you improve this table to be more efficient?');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Given a dictionary, with all possible anagrams of a word, how would you test it out and what is the Data Structure that you will use to construct it with Design of the same.');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'What are virtual constructors in C++ ?');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Print nodes visited in the level order traversal. Nodes of each level should be on a single line.');
INSERT INTO InterviewQuestion VALUES (N'Yahoo!', N'Write a script to be able to expand this regular expression   and print out the results host0[000-100].foo.yahoo.com should return host0000.foo.yahoo.com ... host0100.foo.yahoo.com');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Given n sets of choices: (1,2,3), (2,3,4), (4,5) You pick   one element from each set of choices. Generate all possible picking.');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'In a binary integer value tree, find the lowest level common ancestor of two values.');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Implement integer division without using / or %. Questions about running time. Can you do it faster?');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Given an array with all elements sorted on each individual row and column find the K-th smallest one');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Given a number n, give me a function that returns the nth fibonacci number. Running time, space complexity, iterative vs. recursive.');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Design a max stack using one stack, what are the language features that are missing in your favorite language, tree to a ordered doubly linked list');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'What is the Unix command to view processes?');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Write a function   that takes an integer N and returns an NxN matrix with incrementing integers in a spiral, from outside in. ');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Given an array of numbers and a number k, find if two numbers in the array add up to k. Running time, space complexity, standard questions.');
INSERT INTO InterviewQuestion VALUES (N'Twitter', N'Implement basic Binary Search ');

INSERT INTO Admin VALUES (N'admin', N'1234');
