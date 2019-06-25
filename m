Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7EF55753
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 20:42:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CE2EC02938A;
	Tue, 25 Jun 2019 18:42:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F187860BE5;
	Tue, 25 Jun 2019 18:42:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42EE78E1F;
	Tue, 25 Jun 2019 18:42:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PIIZFD010606 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 14:18:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 197B260C4C; Tue, 25 Jun 2019 18:18:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 137C360C43
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 18:18:30 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FB7F20264
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 18:18:09 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5PI4epq154535; Tue, 25 Jun 2019 18:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to :
	subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=lmgK8Cm3Fl3Y68PjHL3I/TBSUBy/0hTgnkbGgtqK7rI=;
	b=sq8wRGFMDp2keeCzfEbQvRF23m4FZdHqzF6KTStnvsnqKgYJRFIybtKXIRJ/BkjACsOp
	VHjdfFdvkzl4/Qyds9SgcqVsToxzG/t5q2X6QJw92ykC0hsb2bCu0+1HnE8/vR1cKWgj
	9LAuCEvVM/6Q8BB9oO+b2Er0NdC/PFqDczBk7D1I2Io7k9QsIy4cloHAf7QWxHhbVscL
	fa9qlI7JJ3E8N38P1RnUBSFFAK1Ox9ur0vfVe7sOoxdIUQu71AdGqU2biDBGiUMsl2PB
	KOtGcPBYzfwUGEHU5Q7xPZKcvd0Ct/iT3yoSupbQ+ljJ3hcRKX4C0zF8TH1T/hnyBICA
	pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2t9brt63t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 18:17:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5PIHUke113170; Tue, 25 Jun 2019 18:17:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 2t9acc8wvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 25 Jun 2019 18:17:38 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PIHcHG113583;
	Tue, 25 Jun 2019 18:17:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 2t9acc8wve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 18:17:38 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PIHai8000391;
	Tue, 25 Jun 2019 18:17:36 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Jun 2019 11:17:36 -0700
Date: Tue, 25 Jun 2019 11:17:33 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: dsterba@suse.cz, matthew.garrett@nebula.com, yuchao0@huawei.com,
	tytso@mit.edu, shaggy@kernel.org, ard.biesheuvel@linaro.org,
	josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
	jk@ozlabs.org, jack@suse.com, dsterba@suse.com, jaegeuk@kernel.org,
	viro@zeniv.linux.org.uk, cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
	Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Message-ID: <20190625181733.GG5375@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
	<156116138140.1664814.9610454726122206157.stgit@magnolia>
	<20190625171254.GT8917@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625171254.GT8917@twin.jikos.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906250137
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 25 Jun 2019 18:18:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 25 Jun 2019 18:18:19 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 1/4] vfs: create a generic checking
 function for FS_IOC_SETFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 25 Jun 2019 18:42:40 +0000 (UTC)

On Tue, Jun 25, 2019 at 07:12:54PM +0200, David Sterba wrote:
> On Fri, Jun 21, 2019 at 04:56:21PM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
> > values so that we can standardize the implementations that follow ext4's
> > flag values.
> 
> I checked a few samples what's the type of the flags, there are unsigned
> types while the proposed VFS functions take signed type.
> 
> > +int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
> 
> Specifically ext4 uses unsigned type and his was the original API that
> got copied so I'd think that it should unsigned everywhere.

Yeah, I'll change it.

> >  fs/btrfs/ioctl.c    |   13 +++++--------
> 
> For the btrfs bits
> 
> Acked-by: David Sterba <dsterba@suse.com>
> 
> and besides the signedness, the rest of the changes look good to me.

Thanks for the look around!  I'll have a new revision with all changes
out by the end of the day. :)

--D

