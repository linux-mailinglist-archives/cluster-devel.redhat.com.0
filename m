Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD3D228509
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 18:12:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-aejM2-xSO0qaIOjOpqL2SQ-1; Tue, 21 Jul 2020 12:12:26 -0400
X-MC-Unique: aejM2-xSO0qaIOjOpqL2SQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7461DE1;
	Tue, 21 Jul 2020 16:12:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93D352DE6D;
	Tue, 21 Jul 2020 16:12:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1969B730C1;
	Tue, 21 Jul 2020 16:12:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LFxfDG031689 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 11:59:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4B892166BA2; Tue, 21 Jul 2020 15:59:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E9EA2166BA0
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:59:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D0DF83B7FA
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 15:59:38 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-B0Ywoa5bNvCOvOohp572yA-1; Tue, 21 Jul 2020 11:59:36 -0400
X-MC-Unique: B0Ywoa5bNvCOvOohp572yA-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LFhHgH017335; Tue, 21 Jul 2020 15:59:29 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 32bs1me47p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Jul 2020 15:59:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LFi3A7005806; Tue, 21 Jul 2020 15:59:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 32e2s92ddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 15:59:29 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06LFxS58031514;
	Tue, 21 Jul 2020 15:59:28 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 21 Jul 2020 08:59:27 -0700
Date: Tue, 21 Jul 2020 08:59:25 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721155925.GB3151642@magnolia>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de> <20200721152754.GD7597@magnolia>
	<20200721154132.GA11652@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721154132.GA11652@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	mlxlogscore=999
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	bulkscore=0 adultscore=0
	lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
	spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210112
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, linux-man@vger.kernel.org,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Michael Kerrisk <mtk.manpages@gmail.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 05:41:32PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 08:27:54AM -0700, Darrick J. Wong wrote:
> > On Tue, Jul 21, 2020 at 05:16:16PM +0200, Christoph Hellwig wrote:
> > > On Tue, Jul 21, 2020 at 04:14:37PM +0100, Matthew Wilcox wrote:
> > > > On Tue, Jul 21, 2020 at 05:06:15PM +0200, Christoph Hellwig wrote:
> > > > > On Tue, Jul 21, 2020 at 04:04:32PM +0100, Matthew Wilcox wrote:
> > > > > > I thought you were going to respin this with EREMCHG changed to ENOTBLK?
> > > > > 
> > > > > Oh, true.  I'll do that ASAP.
> > > > 
> > > > Michael, could we add this to manpages?
> > > 
> > > Umm, no.  -ENOTBLK is internal - the file systems will retry using
> > > buffered I/O and the error shall never escape to userspace (or even the
> > > VFS for that matter).
> > 
> > It's worth dropping a comment somewhere that ENOTBLK is the desired
> > "fall back to buffered" errcode, seeing as Dave and I missed that in
> > XFS...
> 
> Sounds like a good idea, but what would a good place be?

In the comment that precedes iomap_dio_rw() for the iomap version,
and...

...ye $deity, the old direct-io.c file is a mess of wrappers.  Uh...  a
new comment preceding __blockdev_direct_IO?  Or blockdev_direct_IO?  Or
both?

Or I guess the direct_IO documentation in vfs.rst...?

``direct_IO``
	called by the generic read/write routines to perform direct_IO -
	that is IO requests which bypass the page cache and transfer
	data directly between the storage and the application's address
	space.  This function can return -ENOTBLK to signal that it is
	necessary to fallback to buffered IO.  Note that
	blockdev_direct_IO and variants can also return -ENOTBLK.

--D

