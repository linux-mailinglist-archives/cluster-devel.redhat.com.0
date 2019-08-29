Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839BA0FD6
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Aug 2019 05:12:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EBCDC04959E;
	Thu, 29 Aug 2019 03:12:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 531365C1B5;
	Thu, 29 Aug 2019 03:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E9131802216;
	Thu, 29 Aug 2019 03:12:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7T3CigR024552 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 23:12:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27DDB60610; Thu, 29 Aug 2019 03:12:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20F8F6092D;
	Thu, 29 Aug 2019 03:12:41 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE49308FC4A;
	Thu, 29 Aug 2019 03:12:32 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7T34MnA125004; Thu, 29 Aug 2019 03:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
	bh=IQaZ36+vxcvWv0TBA6kYGf1So8gSKZviXUcYpVtYvko=;
	b=BP92QdFNBVg5+FTlgWVw2UxFp6sUjaWDC28/mNHm6+DV76vouDd46UFTuRqXQWuxLH8o
	Zaptf+CvIhqvxsV3FG9ZlH3svaEbSzyueYZkVlxUUlK6AYSA1+77aFxjuv/CymVrg2az
	IuLaiIeTti1invRuB5GcLTAGOlS5ncxeVij6v+ptOMs9hEbw43dOJ4GE1D1wx8Cg79iq
	pZgh0QDSk+9jGpq/MsMOw7QX7PIL6VdJt1t0/5RjntOMvLnRaCEW0S223Pe1do08wlDn
	RStil+npcHEQycT5thql/Q95BNpvBHmaKGQVw8qhlQghLTH5Tnl7/EE3b8OrEBoA/aPW
	VA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2up69702k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 03:12:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7T34LtQ013256; Thu, 29 Aug 2019 03:12:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2unteu9kke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2019 03:12:23 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7T3CITo028285;
	Thu, 29 Aug 2019 03:12:18 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 28 Aug 2019 20:12:18 -0700
Date: Wed, 28 Aug 2019 20:12:16 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20190829031216.GW1037422@magnolia>
References: <20181202180832.GR8125@magnolia> <20181202181045.GS8125@magnolia>
	<CAHpGcM+WQYFHOOC8SzKq+=DuHVZ4fw4RHLTMUDN-o6GX3YtGvQ@mail.gmail.com>
	<20190828142332.GT1037422@magnolia>
	<CAHpGcMLGWVssWAC1PqBJevr1+1rE_hj4QN27D26j7-Fp_Kzpsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHpGcMLGWVssWAC1PqBJevr1+1rE_hj4QN27D26j7-Fp_Kzpsg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908290033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9363
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908290033
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 29 Aug 2019 03:12:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 29 Aug 2019 03:12:38 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: jencce.kernel@gmail.com, Zorro Lang <zlang@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	fstests <fstests@vger.kernel.org>, linux-xfs <linux-xfs@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Subject: Re: [Cluster-devel] [PATCH v2 2/2] iomap: partially revert
 4721a601099 (simulated directio short read on EFAULT)
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 29 Aug 2019 03:12:56 +0000 (UTC)

On Wed, Aug 28, 2019 at 04:37:59PM +0200, Andreas Grünbacher wrote:
> Am Mi., 28. Aug. 2019 um 16:23 Uhr schrieb Darrick J. Wong
> <darrick.wong@oracle.com>:
> > On Wed, Aug 21, 2019 at 10:23:49PM +0200, Andreas Grünbacher wrote:
> > > Hi Darrick,
> > >
> > > Am So., 2. Dez. 2018 um 19:13 Uhr schrieb Darrick J. Wong
> > > <darrick.wong@oracle.com>:
> > > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > >
> > > > In commit 4721a601099, we tried to fix a problem wherein directio reads
> > > > into a splice pipe will bounce EFAULT/EAGAIN all the way out to
> > > > userspace by simulating a zero-byte short read.  This happens because
> > > > some directio read implementations (xfs) will call
> > > > bio_iov_iter_get_pages to grab pipe buffer pages and issue asynchronous
> > > > reads, but as soon as we run out of pipe buffers that _get_pages call
> > > > returns EFAULT, which the splice code translates to EAGAIN and bounces
> > > > out to userspace.
> > > >
> > > > In that commit, the iomap code catches the EFAULT and simulates a
> > > > zero-byte read, but that causes assertion errors on regular splice reads
> > > > because xfs doesn't allow short directio reads.  This causes infinite
> > > > splice() loops and assertion failures on generic/095 on overlayfs
> > > > because xfs only permit total success or total failure of a directio
> > > > operation.  The underlying issue in the pipe splice code has now been
> > > > fixed by changing the pipe splice loop to avoid avoid reading more data
> > > > than there is space in the pipe.
> > > >
> > > > Therefore, it's no longer necessary to simulate the short directio, so
> > > > remove the hack from iomap.
> > > >
> > > > Fixes: 4721a601099 ("iomap: dio data corruption and spurious errors when pipes fill")
> > > > Reported-by: Amir Goldstein <amir73il@gmail.com>
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > ---
> > > > v2: split into two patches per hch request
> > > > ---
> > > >  fs/iomap.c |    9 ---------
> > > >  1 file changed, 9 deletions(-)
> > > >
> > > > diff --git a/fs/iomap.c b/fs/iomap.c
> > > > index 3ffb776fbebe..d6bc98ae8d35 100644
> > > > --- a/fs/iomap.c
> > > > +++ b/fs/iomap.c
> > > > @@ -1877,15 +1877,6 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> > > >                                 dio->wait_for_completion = true;
> > > >                                 ret = 0;
> > > >                         }
> > > > -
> > > > -                       /*
> > > > -                        * Splicing to pipes can fail on a full pipe. We have to
> > > > -                        * swallow this to make it look like a short IO
> > > > -                        * otherwise the higher splice layers will completely
> > > > -                        * mishandle the error and stop moving data.
> > > > -                        */
> > > > -                       if (ret == -EFAULT)
> > > > -                               ret = 0;
> > > >                         break;
> > > >                 }
> > > >                 pos += ret;
> > >
> > > I'm afraid this breaks the following test case on xfs and gfs2, the
> > > two current users of iomap_dio_rw.
> >
> > Hmm, I had kinda wondered if regular pipes still needed this help.
> > Evidently we don't have a lot of splice tests in fstests. :(
> 
> So what do you suggest as a fix?

(See below)

> > > Here, the splice system call fails with errno = EAGAIN when trying to
> > > "move data" from a file opened with O_DIRECT into a pipe.
> > >
> > > The test case can be run with option -d to not use O_DIRECT, which
> > > makes the test succeed.
> > >
> > > The -r option switches from reading from the pipe sequentially to
> > > reading concurrently with the splice, which doesn't change the
> > > behavior.
> > >
> > > Any thoughts?
> >
> > This would be great as an xfstest! :)
> 
> Or perhaps something generalized from it.
> 
> > Do you have one ready to go, or should I just make one from the source
> > code?
> 
> The bug originally triggered in our internal cluster test system and
> I've recreated the test case I've included from the strace. That's all
> I have for now; feel free to take it, of course.
> 
> It could be that the same condition can be triggered with one of the
> existing utilities (fio/fsstress/...).

Hm, so I made an xfstest out of the program you sent me, and indeed
reverting that chunk makes the failure go away, but that got me
wondering -- that iomap kludge was a workaround for the splice code
telling iomap to try to stuff XXXX bytes into a pipe that only has X
bytes of free buffer space.  We fixed splice_direct_to_actor to clamp
the length parameter to the available pipe space, but we never did the
same to do_splice:

	/* Don't try to read more the pipe has space for. */
	read_len = min_t(size_t, len,
			 (pipe->buffers - pipe->nrbufs) << PAGE_SHIFT);
	ret = do_splice_to(in, &pos, pipe, read_len, flags);

Applying similar logic to the two (opipe != NULL) cases of do_splice()
seem to make the EAGAIN problem go away too.  So why don't we teach
do_splice to only ask for as many bytes as the pipe has space here too?

Does the following patch fix it for you?

--D

From: Darrick J. Wong <darrick.wong@oracle.com>
Subject: [PATCH] splice: only read in as much information as there is pipe buffer space

Andreas Gruenbacher reports that on the two filesystems that support
iomap directio, it's possible for splice() to return -EAGAIN (instead of
a short splice) if the pipe being written to has less space available in
its pipe buffers than the length supplied by the calling process.

Months ago we fixed splice_direct_to_actor to clamp the length of the
read request to the size of the splice pipe.  Do the same to do_splice.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/splice.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/splice.c b/fs/splice.c
index 98412721f056..50335515d7c1 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1101,6 +1101,7 @@ static long do_splice(struct file *in, loff_t __user *off_in,
 	struct pipe_inode_info *ipipe;
 	struct pipe_inode_info *opipe;
 	loff_t offset;
+	unsigned int pipe_pages;
 	long ret;
 
 	ipipe = get_pipe_info(in);
@@ -1123,6 +1124,10 @@ static long do_splice(struct file *in, loff_t __user *off_in,
 		if ((in->f_flags | out->f_flags) & O_NONBLOCK)
 			flags |= SPLICE_F_NONBLOCK;
 
+		/* Don't try to read more the pipe has space for. */
+		pipe_pages = opipe->buffers - opipe->nrbufs;
+		len = min_t(size_t, len, pipe_pages << PAGE_SHIFT);
+
 		return splice_pipe_to_pipe(ipipe, opipe, len, flags);
 	}
 
@@ -1180,8 +1185,13 @@ static long do_splice(struct file *in, loff_t __user *off_in,
 
 		pipe_lock(opipe);
 		ret = wait_for_space(opipe, flags);
-		if (!ret)
+		if (!ret) {
+			/* Don't try to read more the pipe has space for. */
+			pipe_pages = opipe->buffers - opipe->nrbufs;
+			len = min_t(size_t, len, pipe_pages << PAGE_SHIFT);
+
 			ret = do_splice_to(in, &offset, opipe, len, flags);
+		}
 		pipe_unlock(opipe);
 		if (ret > 0)
 			wakeup_pipe_readers(opipe);

