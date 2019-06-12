Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316F41985
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jun 2019 02:37:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F431356CA;
	Wed, 12 Jun 2019 00:37:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B601001B0B;
	Wed, 12 Jun 2019 00:37:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCAFB1806B12;
	Wed, 12 Jun 2019 00:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C0absf005510 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 20:36:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 288A21001B0B; Wed, 12 Jun 2019 00:36:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 230F41001B12
	for <cluster-devel@redhat.com>; Wed, 12 Jun 2019 00:36:34 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11EBAC05E74D
	for <cluster-devel@redhat.com>; Wed, 12 Jun 2019 00:36:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5C0U2aL172563; Wed, 12 Jun 2019 00:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=9gKawnpnm3eYTlbJSmpS31BgWCZu6yO6zvRDwLNExMc=;
	b=vHQc7RiwFlRopnBcV6yXscL30ZNdwN/v/B17eINRtpQHvUvgM6epdVedyPbAKdmcBBV3
	cpQKUJvANpmF9rest4EECBPlFj+c/6FFyA1MB+Y7QHfaviX1SgktsC/OuLuEeHTjfJfn
	IHVrIivC0Er8GlXskbXJ6t5OZcUHTAMhyEJ0O8MOVdKDEgKTHfWtz59o9kiNq/kqTY6E
	4hAomBRtHJLX3EPEAvdgUe3wJJHguniVZBFYytUSwIeEiPqdsoMO2S6x/RCI4kCCEC8X
	5tzrNpCpeUTAjMu2i0Q0axAMVtIdwT/+kMGJyGR6ACAIOztQv/pzRx3K8FTZ+teYFImj
	5Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2t04etrany-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2019 00:35:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5C0YsTE041414; Wed, 12 Jun 2019 00:35:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 2t1jphr047-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Jun 2019 00:35:50 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5C0Zn8q043221;
	Wed, 12 Jun 2019 00:35:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2t1jphr042-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2019 00:35:49 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5C0ZfCm005680;
	Wed, 12 Jun 2019 00:35:41 GMT
Received: from localhost (/10.145.179.81)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 11 Jun 2019 17:35:41 -0700
Date: Tue, 11 Jun 2019 17:35:38 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Message-ID: <20190612003538.GW1871505@magnolia>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
	<156022834076.3227089.14763553158562888103.stgit@magnolia>
	<fb974a33-2192-30ab-9f31-885c3796360b@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb974a33-2192-30ab-9f31-885c3796360b@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9285
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906120001
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 12 Jun 2019 00:36:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 12 Jun 2019 00:36:29 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.399  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, ocfs2-devel@oss.oracle.com,
	matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, josef@toxicpanda.com,
	viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
	tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [Jfs-discussion] [PATCH 1/4] vfs: create a
 generic checking function for FS_IOC_SETFLAGS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 12 Jun 2019 00:37:24 +0000 (UTC)

On Tue, Jun 11, 2019 at 08:41:06AM -0500, Dave Kleikamp wrote:
> On 6/10/19 11:45 PM, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
> > values so that we can standardize the implementations that follow ext4's
> > flag values.
> > 
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
>  -- clip --
> 
> > diff --git a/fs/jfs/ioctl.c b/fs/jfs/ioctl.c
> > index ba34dae8bd9f..c8446d2cd0c7 100644
> > --- a/fs/jfs/ioctl.c
> > +++ b/fs/jfs/ioctl.c
> > @@ -98,6 +98,12 @@ long jfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >  		/* Lock against other parallel changes of flags */
> >  		inode_lock(inode);
> >  
> > +		oldflags = jfs_map_ext2(jfs_inode->mode2 & JFS_FL_USER_VISIBLE,
> > +					0);
> > +		err = vfs_ioc_setflags_check(inode, oldflags, flags);
> > +		if (err)
> > +			goto setflags_out;
> 
> inode_unlock(inode) is not called on the error path.
> 
> > +
> >  		oldflags = jfs_inode->mode2;
> >  
> >  		/*
> 
> This patch leaves jfs's open-coded version of the same check.

Heh, thanks for pointing that out.  I'll fix both of those things.

--D

> Thanks,
> Shaggy

