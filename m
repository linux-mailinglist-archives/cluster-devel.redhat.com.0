Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F122922851A
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 18:14:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-lhPxN7jbMiehzlDaIHu_ig-1; Tue, 21 Jul 2020 12:14:24 -0400
X-MC-Unique: lhPxN7jbMiehzlDaIHu_ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795EE1DEA;
	Tue, 21 Jul 2020 16:14:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 691B37268E;
	Tue, 21 Jul 2020 16:14:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5605B730C0;
	Tue, 21 Jul 2020 16:14:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LG6Abo032727 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 12:06:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B19BA2166B28; Tue, 21 Jul 2020 16:06:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB992166BA0
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:06:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 248F483B7F9
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 16:06:07 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-iQG8DYz2Ox2TgDXL6DEp7g-1; Tue, 21 Jul 2020 12:06:00 -0400
X-MC-Unique: iQG8DYz2Ox2TgDXL6DEp7g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LG3SUe077647; Tue, 21 Jul 2020 16:05:47 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 32d6ksjdcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Jul 2020 16:05:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LG4A4i054834; Tue, 21 Jul 2020 16:05:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 32e3j403mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 16:05:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06LG5iAF015966;
	Tue, 21 Jul 2020 16:05:44 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 21 Jul 2020 16:05:44 +0000
Date: Tue, 21 Jul 2020 09:05:42 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721160542.GD3151642@magnolia>
References: <20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de> <20200721152754.GD7597@magnolia>
	<20200721154132.GA11652@lst.de> <20200721155925.GB3151642@magnolia>
	<20200721160143.GA12046@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721160143.GA12046@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=1
	bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
	priorityscore=1501
	lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210113
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 06:01:43PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 08:59:25AM -0700, Darrick J. Wong wrote:
> > In the comment that precedes iomap_dio_rw() for the iomap version,
> 
> maybe let's just do that..
> 
> > ``direct_IO``
> > 	called by the generic read/write routines to perform direct_IO -
> > 	that is IO requests which bypass the page cache and transfer
> > 	data directly between the storage and the application's address
> > 	space.  This function can return -ENOTBLK to signal that it is
> > 	necessary to fallback to buffered IO.  Note that
> > 	blockdev_direct_IO and variants can also return -ENOTBLK.
> 
> ->direct_IO is not used for iomap and various other implementations.
> In fact it is a horrible hack that I've been trying to get rid of
> for a while.

Agreed, but for now there are still a number of fses who are still on
the old directio code; let's try to keep the drainbamage/confusion
potential to a minimum so it doesn't spread to our iomap shinyness. :)

--D

