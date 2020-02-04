Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2821151F1B
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Feb 2020 18:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580836624;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hgFqJ3UDTM5sqlrCPmGWveQi/Nzk5MoMNJQwmmAFssw=;
	b=et3VnGZbgkfWOuz7taguvSe8n7m4TaFpDM/32mSqpVjj6lsLDCb4W93ejD6pzO22OXJjEr
	WyKkCW4UC4R4FZuWXbicksP2wJe/wxnf1wHvy1c5rjxv/MuWOsF/1clpOD8OE+/VYxH4UO
	Ao5sK7FcCJVU1A1oj2fm31F78fjJUCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-TaSJ7R_6O260WFZ5CpolRA-1; Tue, 04 Feb 2020 12:17:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE84218CA257;
	Tue,  4 Feb 2020 17:16:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 040C95C1D8;
	Tue,  4 Feb 2020 17:16:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E57551803C33;
	Tue,  4 Feb 2020 17:16:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014HGpdI004301 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 12:16:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B08A10F8E21; Tue,  4 Feb 2020 17:16:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86F191104E6E
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 17:16:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85EEA800F5F
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 17:16:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-293-p5n8fTTgNkiZIVw2Fb9Uaw-1; Tue, 04 Feb 2020 12:16:47 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iz1oN-0000iE-LX; Tue, 04 Feb 2020 17:16:31 +0000
Date: Tue, 4 Feb 2020 09:16:31 -0800
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	cluster-devel@redhat.com, ocfs2-devel@oss.oracle.com
Message-ID: <20200204171631.GM8731@bombadil.infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
	<20200204153227.GF2654@twin.jikos.cz>
MIME-Version: 1.0
In-Reply-To: <20200204153227.GF2654@twin.jikos.cz>
X-MC-Unique: p5n8fTTgNkiZIVw2Fb9Uaw-1
X-MC-Unique: TaSJ7R_6O260WFZ5CpolRA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 014HGpdI004301
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v4 00/12] Change readahead API
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 04, 2020 at 04:32:27PM +0100, David Sterba wrote:
> On Sat, Feb 01, 2020 at 07:12:28AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > I would particularly value feedback on this from the gfs2 and ocfs2
> > maintainers.  They have non-trivial changes, and a review on patch 5
> > would be greatly appreciated.
> >=20
> > This series adds a readahead address_space operation to eventually
> > replace the readpages operation.  The key difference is that
> > pages are added to the page cache as they are allocated (and
> > then looked up by the filesystem) instead of passing them on a
> > list to the readpages operation and having the filesystem add
> > them to the page cache.  It's a net reduction in code for each
> > implementation, more efficient than walking a list, and solves
> > the direct-write vs buffered-read problem reported by yu kuai at
> > https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@hu=
awei.com/
> >=20
> > v4:
> >  - Rebase on current Linus (a62aa6f7f50a ("Merge tag 'gfs2-for-5.6'"))
>=20
> I've tried to test the patchset but haven't got very far, it crashes at b=
oot
> ritht after VFS mounts the root. The patches are from mailinglist, applie=
d on
> current master, bug I saw the same crash with the git branch in your
> repo (probably v1).

Yeah, I wasn't able to test at the time due to what turned out to be
the hpet bug in Linus' tree.  Now that's fixed, I've found & fixed a
couple more bugs.  There'll be a v5 once I fix the remaining problem
(looks like a missing page unlock somewhere).


