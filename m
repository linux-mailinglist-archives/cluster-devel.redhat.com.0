Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2314B229D33
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jul 2020 18:36:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-SHgkrECmNwuge7lfn17--Q-1; Wed, 22 Jul 2020 12:36:16 -0400
X-MC-Unique: SHgkrECmNwuge7lfn17--Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B59100A696;
	Wed, 22 Jul 2020 16:36:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 014A978559;
	Wed, 22 Jul 2020 16:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CF44730C4;
	Wed, 22 Jul 2020 16:36:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MGFmPv020615 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 12:15:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF891208DD88; Wed, 22 Jul 2020 16:15:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB09F2026D69
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 16:15:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEAB51006840
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 16:15:45 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-27Y8XSlNNM6AnAp6iqwbmA-1; Wed, 22 Jul 2020 12:15:43 -0400
X-MC-Unique: 27Y8XSlNNM6AnAp6iqwbmA-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06MFuUmc190158; Wed, 22 Jul 2020 16:15:31 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 32brgrmaqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 22 Jul 2020 16:15:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06MFwB5L096647; Wed, 22 Jul 2020 16:15:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 32erheh0mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2020 16:15:30 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06MGFQFN011293;
	Wed, 22 Jul 2020 16:15:26 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 22 Jul 2020 09:15:25 -0700
Date: Wed, 22 Jul 2020 09:15:23 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200722153744.GN3151642@magnolia>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
	<20200721203749.GF3151642@magnolia> <20200722061850.GA24799@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200722061850.GA24799@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 suspectscore=1
	mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007220108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0 spamscore=0
	impostorscore=0 suspectscore=1 adultscore=0 clxscore=1015
	mlxlogscore=999
	priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007220108
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes
 for invalidation failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2020 at 08:18:50AM +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 01:37:49PM -0700, Darrick J. Wong wrote:
> > On Tue, Jul 21, 2020 at 08:31:57PM +0200, Christoph Hellwig wrote:
> > > Failing to invalid the page cache means data in incoherent, which is
> > > a very bad state for the system.  Always fall back to buffered I/O
> > > through the page cache if we can't invalidate mappings.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > Acked-by: Dave Chinner <dchinner@redhat.com>
> > > Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > 
> > For the iomap and xfs parts,
> > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > But I'd still like acks from Ted, Andreas, and Damien for ext4, gfs2,
> > and zonefs, respectively.
> > 
> > (Particularly if anyone was harboring ideas about trying to get this in
> > before 5.10, though I've not yet heard anyone say that explicitly...)
> 
> Why would we want to wait another whole merge window?

Well it /is/ past -rc6, which is a tad late...

OTOH we've been talking about this for 2 months now and most of the
actual behavior change is in xfs land so maybe it's fine. :)

--D

