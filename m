Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20F168B57
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Feb 2020 02:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582333256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7ucI9OHkT7DC8Lhw9pvMrZn8tdurQHUsFfpgvBsi28I=;
	b=cPbCLvdb3PhMgyc21EsWhgP9fPKml/AS4vnkpuCVD96wTOFawPLWsWvQW2udW/YVJ0zUbb
	aVWh9lyDQBfVe30J4oQWEhbCF201UI35pwUu+l/Rl1bjxDJ0yDJ7kDfLAQEu7u9sT6NSEq
	AY1qyhttTl42bGtx8+eCobnazBcMvqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-WG7waGbdM2-vYUHmYlDb-Q-1; Fri, 21 Feb 2020 20:00:54 -0500
X-MC-Unique: WG7waGbdM2-vYUHmYlDb-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FC8A800D50;
	Sat, 22 Feb 2020 01:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1F79076C;
	Sat, 22 Feb 2020 01:00:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1874860C8;
	Sat, 22 Feb 2020 01:00:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01M10kmR004697 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 20:00:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06FC61649F9; Sat, 22 Feb 2020 01:00:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01718165447
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:00:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B52D98007DF
	for <cluster-devel@redhat.com>; Sat, 22 Feb 2020 01:00:43 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-3u4zP3UMPX6lJIjIft6QDA-1; Fri, 21 Feb 2020 20:00:41 -0500
X-MC-Unique: 3u4zP3UMPX6lJIjIft6QDA-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01M0wwHb129568; Sat, 22 Feb 2020 01:00:17 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2y8uddkkxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Feb 2020 01:00:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01M0wAGX166595; Sat, 22 Feb 2020 01:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 2y8udrmdde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sat, 22 Feb 2020 01:00:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01M10Gmj170782;
	Sat, 22 Feb 2020 01:00:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2y8udrmdb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Feb 2020 01:00:16 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01M10Ft2027686;
	Sat, 22 Feb 2020 01:00:15 GMT
Received: from localhost (/10.145.179.117)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 21 Feb 2020 17:00:15 -0800
Date: Fri, 21 Feb 2020 17:00:13 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200222010013.GH9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
	<20200220154912.GC19577@infradead.org>
	<20200220165734.GZ24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220165734.GZ24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	impostorscore=0
	mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
	priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
	lowpriorityscore=0
	clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002220003
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01M10kmR004697
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
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
> >=20
> > Isn't the context documentation something that belongs into the aop
> > documentation?  I've never really seen the value of duplicating this
> > information in method instances, as it is just bound to be out of date
> > rather sooner than later.
>=20
> I'm in two minds about it as well.  There's definitely no value in
> providing kernel-doc for implementations of a common interface ... so
> rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
> isn't just the implementation, like nilfs2_readahead() is, it's a library
> function for filesystems to call, so it deserves documentation.  On the
> other hand, there's no real thought to this on the part of the filesystem=
;
> the implementation just calls this with the appropriate ops pointer.
>=20
> Then again, I kind of feel like we need more documentation of iomap to
> help filesystems convert to using it.  But maybe kernel-doc isn't the
> mechanism to provide that.

I think we need more documentation of the parts of iomap where it can
call back into the filesystem (looking at you, iomap_dio_ops).

I'm not opposed to letting this comment stay, though I don't see it as
all that necessary since iomap_readahead implements a callout that's
documented in vfs.rst and is thus subject to all the constraints listed
in the (*readahead) documentation.

--D


