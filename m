Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA35756F
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jun 2019 02:23:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FD69C00C7DD;
	Thu, 27 Jun 2019 00:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E84D1001281;
	Thu, 27 Jun 2019 00:23:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BC1A206D2;
	Thu, 27 Jun 2019 00:23:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5R0MgGa005654 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 20:22:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E09D01001B06; Thu, 27 Jun 2019 00:22:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA51E1001B02
	for <cluster-devel@redhat.com>; Thu, 27 Jun 2019 00:22:40 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15587308213C
	for <cluster-devel@redhat.com>; Thu, 27 Jun 2019 00:22:32 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5R095sZ153911; Thu, 27 Jun 2019 00:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=OZ6e0FbvZ6ih1IklP3kOWEbcdJlaHfvXLF3leRVcWUY=;
	b=nB7qaexUVLsnWtZZL8ilmpxLc4CbV8CD4zkMKrWoh3xml3JhUaIp9+OiX8KWgEiq+QTV
	TmxH5cPDR/GN/Mim9pS0HSeUZriivu5IXjKymJeB4VlwuYqux8YFE96Q7ZuFaywS9GAs
	IfOynDYAH9wgXQWBBSy6D0VCSg6NmF9n/ECyAKjhrIbHx+AeA7tGFvV0wlMxz0hVhnnB
	xmxNQ5IUCjtH5vC5g7w5I84m4u6ESWlV3qRYMg8v1xYN3YBxl87OiOZnnvitl0kRmOQG
	ZRsajauz8/ilsNemW/ld4kcCe0+NXHIqitakDgA0iOejAf6kjQWlHHswxg9S0B9x2R/i
	YA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2t9brtd8qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 00:21:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5R0I1KJ030470; Thu, 27 Jun 2019 00:19:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 2t99f4r2nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 27 Jun 2019 00:19:34 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5R0JYLu032344;
	Thu, 27 Jun 2019 00:19:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 2t99f4r2n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 00:19:34 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5R0JTqS006644;
	Thu, 27 Jun 2019 00:19:29 GMT
Received: from localhost (/10.145.178.41)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Jun 2019 17:19:28 -0700
Date: Wed, 26 Jun 2019 17:19:26 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190627001926.GL5171@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
	<156151633829.2283456.834142172527987802.stgit@magnolia>
	<20190626041133.GB32272@ZenIV.linux.org.uk>
	<20190626153542.GE5171@magnolia>
	<20190626154302.GA31445@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626154302.GA31445@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906270000
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Thu, 27 Jun 2019 00:22:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 27 Jun 2019 00:22:37 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, josef@toxicpanda.com,
	reiserfs-devel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, dsterba@suse.com,
	jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 2/5] vfs: create a generic checking
 function for FS_IOC_FSSETXATTR
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 27 Jun 2019 00:23:21 +0000 (UTC)

On Wed, Jun 26, 2019 at 08:43:02AM -0700, Christoph Hellwig wrote:
> On Wed, Jun 26, 2019 at 08:35:42AM -0700, Darrick J. Wong wrote:
> > > static inline void simple_fill_fsxattr(struct fsxattr *fa, unsigned xflags)
> > > {
> > > 	memset(fa, 0, sizeof(*fa));
> > > 	fa->fsx_xflags = xflags;
> > > }
> > > 
> > > and let the compiler optimize the crap out?
> > 
> > The v2 series used to do that, but Christoph complained that having a
> > helper for a two-line memset and initialization was silly[1] so now we
> > have this version.
> > 
> > I don't mind reinstating it as a static inline helper, but I'd like some
> > input from any of the btrfs developers (or you, Al) about which form is
> > preferred.
> 
> I complained having that helper in btrfs.  I think Al wants a generic
> one, which at least makes a little more sense.

Ok.

> That being said I wonder if we should lift these attr ioctls to
> file op methods and deal with all that crap in VFS code instead of
> having all those duplicated ioctl parsers.

That sounds like an excellent next patchset. :)

--D

