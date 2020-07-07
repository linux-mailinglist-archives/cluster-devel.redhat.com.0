Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 730A92176B6
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jul 2020 20:29:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-D2WsCWZKOcKI79JLrseDGw-1; Tue, 07 Jul 2020 14:29:14 -0400
X-MC-Unique: D2WsCWZKOcKI79JLrseDGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD82D10524FF;
	Tue,  7 Jul 2020 18:29:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 886F65C1B2;
	Tue,  7 Jul 2020 18:29:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0CEA87895;
	Tue,  7 Jul 2020 18:29:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067IT2YG022928 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 14:29:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DBF71004049; Tue,  7 Jul 2020 18:29:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F91114F38A
	for <cluster-devel@redhat.com>; Tue,  7 Jul 2020 18:28:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45174101A525
	for <cluster-devel@redhat.com>; Tue,  7 Jul 2020 18:28:58 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-fw1nEyEFNr-mul9qsIobcA-1; Tue, 07 Jul 2020 14:28:55 -0400
X-MC-Unique: fw1nEyEFNr-mul9qsIobcA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	067DucOv160138; Tue, 7 Jul 2020 14:01:34 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 323sxxrx52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 07 Jul 2020 14:01:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	067DwEhL040674; Tue, 7 Jul 2020 14:01:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 3233px70st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jul 2020 14:01:30 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 067E1NQe022252;
	Tue, 7 Jul 2020 14:01:23 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 07 Jul 2020 07:01:23 -0700
Date: Tue, 7 Jul 2020 07:01:20 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20200707140120.GJ7606@magnolia>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707134952.3niqhxngwh3gus54@fiona>
MIME-Version: 1.0
In-Reply-To: <20200707134952.3niqhxngwh3gus54@fiona>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9674
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	adultscore=0 spamscore=0
	mlxscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2007070104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9674
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 mlxlogscore=999
	bulkscore=0 impostorscore=0 adultscore=0 cotscore=-2147483648
	phishscore=0
	priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=1
	spamscore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2007070104
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, david@fromorbit.com,
	dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] always fall back to buffered I/O after
 invalidation failures,
 was: Re: [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page
 invalidation fails
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 08:49:52AM -0500, Goldwyn Rodrigues wrote:
> On 13:57 07/07, Matthew Wilcox wrote:
> > On Tue, Jul 07, 2020 at 07:43:46AM -0500, Goldwyn Rodrigues wrote:
> > > On  9:53 01/07, Christoph Hellwig wrote:
> > > > On Mon, Jun 29, 2020 at 02:23:49PM -0500, Goldwyn Rodrigues wrote:
> > > > > From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > > > 
> > > > > For direct I/O, add the flag IOMAP_DIO_RWF_NO_STALE_PAGECACHE to indicate
> > > > > that if the page invalidation fails, return back control to the
> > > > > filesystem so it may fallback to buffered mode.
> > > > > 
> > > > > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > > 
> > > > I'd like to start a discussion of this shouldn't really be the
> > > > default behavior.  If we have page cache that can't be invalidated it
> > > > actually makes a whole lot of sense to not do direct I/O, avoid the
> > > > warnings, etc.
> > > > 
> > > > Adding all the relevant lists.
> > > 
> > > Since no one responded so far, let me see if I can stir the cauldron :)
> > > 
> > > What error should be returned in case of such an error? I think the
> > 
> > Christoph's message is ambiguous.  I don't know if he means "fail the
> > I/O with an error" or "satisfy the I/O through the page cache".  I'm
> > strongly in favour of the latter.  Indeed, I'm in favour of not invalidating
> > the page cache at all for direct I/O.  For reads, I think the page cache
> > should be used to satisfy any portion of the read which is currently
> 
> That indeed would make reads faster. How about if the pages are dirty
> during DIO reads?
> Should a direct I/O read be responsible for making sure that the dirty
> pages are written back. Technically direct I/O reads is that we are
> reading from the device.

The filemap_write_and_wait_range should persist that data, right?

> > cached.  For writes, I think we should write into the page cache pages
> > which currently exist, and then force those pages to be written back,
> > but left in cache.
> 
> Yes, that makes sense.
> If this is implemented, what would be the difference between O_DIRECT
> and O_DSYNC, if any?

Presumably a direct write would proceed as it does today if there's no
pagecache at all?

--D

> -- 
> Goldwyn

