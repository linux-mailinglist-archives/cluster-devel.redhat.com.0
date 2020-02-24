Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94C2D16AC37
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 17:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582563217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KtPncZ1yFnfYrnk6OJ0StE6zUYL2d1WPNl8A6d+O+7Q=;
	b=C/0v2OoQMPeipJ7wtb2tFjJD0CXmAAsn9iZueqNQ29xuqHKe+pzWjQMwJsauW+tnQC4jwv
	3WRQ6VoYY+/7RWQCqSZsoaPlmLa3TBKFy57dVEB2K5SFQeCJvJbDxFKh/9GZjcLCIexWpR
	wU9WjXfr9OHZR93Y3/7BZcSry+rmfRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-UNBJCFgtPr6jAP6td1kLzQ-1; Mon, 24 Feb 2020 11:53:35 -0500
X-MC-Unique: UNBJCFgtPr6jAP6td1kLzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64513801E5C;
	Mon, 24 Feb 2020 16:53:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB7E15D9CD;
	Mon, 24 Feb 2020 16:53:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AC0718095FF;
	Mon, 24 Feb 2020 16:53:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OGrPVm001011 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 11:53:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CBBEC2028CD5; Mon, 24 Feb 2020 16:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5307200AD4C
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 16:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EB180030A
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 16:53:23 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146--W1NOFsLPOKpv16OkwWHjg-1; Mon, 24 Feb 2020 11:53:20 -0500
X-MC-Unique: -W1NOFsLPOKpv16OkwWHjg-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01OGXk6G161015; Mon, 24 Feb 2020 16:52:48 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2ybvr4mwhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2020 16:52:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01OGW70l165513; Mon, 24 Feb 2020 16:52:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 2yby5cs488-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 24 Feb 2020 16:52:48 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01OGq2Tj073644;
	Mon, 24 Feb 2020 16:52:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 2yby5cs464-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2020 16:52:47 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OGqjpe019886;
	Mon, 24 Feb 2020 16:52:45 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 24 Feb 2020 08:52:45 -0800
Date: Mon, 24 Feb 2020 08:52:44 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224165244.GA6731@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
	<20200220154912.GC19577@infradead.org>
	<20200220165734.GZ24185@bombadil.infradead.org>
	<20200222010013.GH9506@magnolia>
	<20200224043355.GL24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200224043355.GL24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	spamscore=0
	clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
	priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0
	phishscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002240129
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OGrPVm001011
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 22/24] iomap: Convert from readpages
	to readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sun, Feb 23, 2020 at 08:33:55PM -0800, Matthew Wilcox wrote:
> On Fri, Feb 21, 2020 at 05:00:13PM -0800, Darrick J. Wong wrote:
> > On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> > > On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
> > > +/**
> > > + * iomap_readahead - Attempt to read pages from a file.
> > > + * @rac: Describes the pages to be read.
> > > + * @ops: The operations vector for the filesystem.
> > > + *
> > > + * This function is for filesystems to call to implement their reada=
head
> > > + * address_space operation.
> > > + *
> > > + * Context: The file is pinned by the caller, and the pages to be re=
ad are
> > > + * all locked and have an elevated refcount.  This function will unl=
ock
> > > + * the pages (once I/O has completed on them, or I/O has been determ=
ined to
> > > + * not be necessary).  It will also decrease the refcount once the p=
ages
> > > + * have been submitted for I/O.  After this point, the page may be r=
emoved
> > > + * from the page cache, and should not be referenced.
> > > + */
> > >=20
> > > > Isn't the context documentation something that belongs into the aop
> > > > documentation?  I've never really seen the value of duplicating thi=
s
> > > > information in method instances, as it is just bound to be out of d=
ate
> > > > rather sooner than later.
> > >=20
> > > I'm in two minds about it as well.  There's definitely no value in
> > > providing kernel-doc for implementations of a common interface ... so
> > > rather than fixing the nilfs2 kernel-doc, I just deleted it.  But thi=
s
> > > isn't just the implementation, like nilfs2_readahead() is, it's a lib=
rary
> > > function for filesystems to call, so it deserves documentation.  On t=
he
> > > other hand, there's no real thought to this on the part of the filesy=
stem;
> > > the implementation just calls this with the appropriate ops pointer.
> > >=20
> > > Then again, I kind of feel like we need more documentation of iomap t=
o
> > > help filesystems convert to using it.  But maybe kernel-doc isn't the
> > > mechanism to provide that.
> >=20
> > I think we need more documentation of the parts of iomap where it can
> > call back into the filesystem (looking at you, iomap_dio_ops).
> >=20
> > I'm not opposed to letting this comment stay, though I don't see it as
> > all that necessary since iomap_readahead implements a callout that's
> > documented in vfs.rst and is thus subject to all the constraints listed
> > in the (*readahead) documentation.
>=20
> Right.  And that's not currently in kernel-doc format, but should be.
> Something for a different patchset, IMO.
>=20
> What we need documenting _here_ is the conditions under which the
> iomap_ops are called so the filesystem author doesn't need to piece them
> together from three different places.  Here's what I currently have:
>=20
>  * Context: The @ops callbacks may submit I/O (eg to read the addresses o=
f
>  * blocks from disc), and may wait for it.  The caller may be trying to
>  * access a different page, and so sleeping excessively should be avoided=
.
>  * It may allocate memory, but should avoid large allocations.  This
>  * function is called with memalloc_nofs set, so allocations will not cau=
se
>  * the filesystem to be reentered.

How large? :)

--D


