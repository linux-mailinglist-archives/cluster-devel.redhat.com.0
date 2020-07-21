Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C8DFE2287F9
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jul 2020 20:07:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-_drPP7TCM5KOweeCPQbflw-1; Tue, 21 Jul 2020 14:06:57 -0400
X-MC-Unique: _drPP7TCM5KOweeCPQbflw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D4B1083E81;
	Tue, 21 Jul 2020 18:06:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADA65BAD5;
	Tue, 21 Jul 2020 18:06:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 186D01809561;
	Tue, 21 Jul 2020 18:06:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06LI4tYX015887 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 14:04:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9942105619F; Tue, 21 Jul 2020 18:04:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2EA210BBCC4
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:04:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC138007D0
	for <cluster-devel@redhat.com>; Tue, 21 Jul 2020 18:04:53 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-377-8YuesxMfOmahWUNK--leXw-1; Tue, 21 Jul 2020 14:04:51 -0400
X-MC-Unique: 8YuesxMfOmahWUNK--leXw-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LFHUKa161225; Tue, 21 Jul 2020 15:29:59 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 32bs1mdxg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 21 Jul 2020 15:29:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06LFN2oV044772; Tue, 21 Jul 2020 15:27:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 32dyj646hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 15:27:58 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06LFRuxF032038;
	Tue, 21 Jul 2020 15:27:56 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 21 Jul 2020 08:27:56 -0700
Date: Tue, 21 Jul 2020 08:27:54 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200721152754.GD7597@magnolia>
References: <20200713074633.875946-1-hch@lst.de>
	<20200720215125.bfz7geaftocy4r5l@fiona>
	<20200721145313.GA9217@lst.de>
	<20200721150432.GH15516@casper.infradead.org>
	<20200721150615.GA10330@lst.de>
	<20200721151437.GI15516@casper.infradead.org>
	<20200721151616.GA11074@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721151616.GA11074@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	adultscore=0 suspectscore=1
	mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	bulkscore=0 adultscore=0
	lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
	spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007210111
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Tue, Jul 21, 2020 at 05:16:16PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 04:14:37PM +0100, Matthew Wilcox wrote:
> > On Tue, Jul 21, 2020 at 05:06:15PM +0200, Christoph Hellwig wrote:
> > > On Tue, Jul 21, 2020 at 04:04:32PM +0100, Matthew Wilcox wrote:
> > > > I thought you were going to respin this with EREMCHG changed to ENOTBLK?
> > > 
> > > Oh, true.  I'll do that ASAP.
> > 
> > Michael, could we add this to manpages?
> 
> Umm, no.  -ENOTBLK is internal - the file systems will retry using
> buffered I/O and the error shall never escape to userspace (or even the
> VFS for that matter).

It's worth dropping a comment somewhere that ENOTBLK is the desired
"fall back to buffered" errcode, seeing as Dave and I missed that in
XFS...

--D

