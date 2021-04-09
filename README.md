<h1>Pewlett-Hackard Analysis</h1>

<h2>Overview of Project</h2>

<h3>Purpose</h3>
<p>
"Baby Boomers" are retiring at a rapid rate.  Pewlett-Hackard (P-H) recognizes the danger this poses as thousands of their own employees are coming up for retirement in a matter of a few short years.  To prepare for such an event as the impending mass retirements, P-H has decided to conduct a study to get ahead of the thousands of job openings.  The main purpose of the study is to:
<ol>
  <li>Determine the number of retiring employees per title.</li>
  <li>Identify employees who are eligible to participate in a mentorship program.</li>
</ol>
</p>
<h2>Results</h2>

<h3>4 Major Points</h3>
<ul>
<li><b>Departing 'Senior' Title Crisis</b>: In reviewing who will be retiring by title and the total list of employees eligible for mentorship there is a cause for concern in terms of who can replace Senior Engineers and Senior Staff.  In total there were found to be 1,549 employees eligible for mentorship, however there are over 29,000 Senior Engineers and over 28,000 Senior Staff eligible for retirement.  The difference is even greater ocne you remove the 283 Senior Engineers and 440 Senior Staff from the pool of mentorship eligible employees.  While this may assist with reducing the cost of salaries, ensuring that staff moving forward is among the existing top talent is crucial for a reputable company such as P-H.</li>
<li><b>40% of Management Positions Open</b>: While possibly indicitavie of a larger issue or unclean data to begin with.  Using the provided records, we see that 2 active Department Managers (out of 5 total active) fall in the retirement eligible pool of employees.  While the total number of open positions is not large, replacing 40% of management will result in adjustments and/or reorganization of at least that much of the organization under new leadership.</li>
<li><b>>41,000 Soon-To-Be Openings:</b> From the data in the retirement_info table, the total number of employees eligible for retirement is greater than 41,000.  While not everybody may necessarily retire as soon as eligible, there are 41,000 positions to prepare training or recruitment for over the next few years, no small feat.</li>
<li><b>Hire New Development Team Members Early:</b>  In looking at which departments will be hit hardest by the retirement wave, Development and Production lead the way.  Considering the amount of time it can take to train engineers, it may be worthwhile, to prevent a large lapse in Development work, to begin hiring and training the new engineers now as they often have the lengthiest, most expensive onboarding of all departments.  With >25,000 Development employees slated to retire soon there are bound to be project delays as a result without trained staff ready to step into the vacated roles of the retired.</li>
</ul>

<h2>Summary</h2>

<h3>Insights and Additional Recommendations</h3>
<ol>
  <li><b>Expand the mentor-eligible population:</b> Using the provided query below, you will be able to view the total number of mentorship-eligible employees by Title.  What you will find is such a low number of mentor-eligible employees per title (0 in Management) that doubling a given title and then tripling that result still leaves each title with fewer employees eligible for mentorship than are eligible to retire.  Expanding the eligibility for mentorship by age or even inlcuding those with stellar performance evaluation ratings (provided that data is housed somewhere in the HRS) could be useful if the goal is to promote from within.  However with around 1,500 mentor eligible employees under the current criteria, and more than 41,000 retirement-related openings, an expansion of the mentorship eligible staff is highly advised.

    SELECT 
      COUNT(title),
      title
    FROM mentorship_eligibility
    Group By title;
</li>
<li><b>Prepare Department Heads</b>: Running the query below will provide the number of retirement eligible employees by department for all departments.  As referenced above, Development and Production are in line to see the greatest number of retirements, followed by Sales.  Despite other departments not being affected to the degree of the 3 previously mentiond departments, it will be wise to prepare all Department Managers, or at least the 3 remaining after 2 retire, for the impending mass retirement.

    SELECT 
      COUNT(d.dept_name),
      d.dept_name
    FROM unique_titles AS ut
      INNER JOIN dept_emp AS de
        ON ut.emp_no = de.emp_no
        INNER JOIN departments AS d
          ON de.dept_no = d.dept_no
    GROUP BY dept_name;
</li>
</ol>
</p>
