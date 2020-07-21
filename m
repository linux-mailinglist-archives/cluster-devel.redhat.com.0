Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 36DA6228518
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 18:14:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-F86g5KWgPJmHsKUMtnRfRw-1; Tue, 21 Jul 2020 12:14:23 -0400
X-MC-Unique: F86g5KWgPJmHsKUMtnRfRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D244189CEE8;
	Tue, 21 Jul 2020 16:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B50374F45;
	Tue, 21 Jul 2020 16:14:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E81741800FEE;
	Tue, 21 Jul 2020 16:14:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LG61eX032707 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 12:06:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 572C92026D69; Tue, 21 Jul 2020 16:06:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 528AE201828D
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:05:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57C458007D7
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:05:59 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-41-V0yKXkwOPsuAUHFs1LIiLw-1; Tue, 21 Jul 2020 12:05:56 -0400
X-MC-Unique: V0yKXkwOPsuAUHFs1LIiLw-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LG1UVD048595; Tue, 21 Jul 2020 16:05:47 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 32bs1me5ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Jul 2020 16:05:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LFi0cn060765; Tue, 21 Jul 2020 16:03:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 32e33ght6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 16:03:47 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06LG3i8F028849;
	Tue, 21 Jul 2020 16:03:45 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 21 Jul 2020 16:03:44 +0000
Date: Tue, 21 Jul 2020 09:03:42 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200721160342.GC3151642@magnolia>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de>
	<20200721153136.GJ15516@casper.infradead.org>
	<20200721154240.GB11652@lst.de>
	<20200721155201.GL15516@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200721155201.GL15516@casper.infradead.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	suspectscore=1
	malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	bulkscore=0 adultscore=0
	lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
	spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210113
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, linux-man@vger.kernel.org,
	Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, cluster-devel@redhat.com,
	Michael Kerrisk <mtk.manpages@gmail.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] RFC: iomap write invalidation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 04:52:01PM +0100, Matthew Wilcox wrote:
> On Tue, Jul 21, 2020 at 05:42:40PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 21, 2020 at 04:31:36PM +0100, Matthew Wilcox wrote:
> > > > Umm, no.  -ENOTBLK is internal - the file systems will retry using
> > > > buffered I/O and the error shall never escape to userspace (or even the
> > > > VFS for that matter).
> > > 
> > > Ah, I made the mistake of believing the comments that I could see in
> > > your patch instead of reading the code.
> > > 
> > > Can I suggest deleting this comment:
> > > 
> > >         /*
> > >          * No fallback to buffered IO on errors for XFS, direct IO will either
> > >          * complete fully or fail.
> > >          */
> > > 
> > > and rewording this one:
> > > 
> > >                 /*
> > >                  * Allow a directio write to fall back to a buffered
> > >                  * write *only* in the case that we're doing a reflink
> > >                  * CoW.  In all other directio scenarios we do not
> > >                  * allow an operation to fall back to buffered mode.
> > >                  */
> > > 
> > > as part of your revised patchset?
> > 
> > That isn't actually true.  In current mainline we only fallback on
> > reflink RMW cases, but with this series we also fall back for
> > invalidation failures.
> 
> ... that's why I'm suggesting that you delete the first one and rewrite
> the second one.  Because they aren't true.

/*
 * We allow only three outcomes of a directio: (1) it succeeds
 * completely; (2) it fails with a negative error code; or (3) it
 * returns -ENOTBLK to signal that we should fall back to buffered IO.
 *
 * The third scenario should only happen if iomap refuses to perform the
 * direct IO, or the direct write request requires CoW but is not aligned
 * to the filesystem block size.
 */

?

--D

