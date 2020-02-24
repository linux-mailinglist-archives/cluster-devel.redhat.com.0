Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB41E16B36C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582581477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zbMliVxtg60FD0AvGU1u6zBXGUQnX38kf6tamM4z0qU=;
	b=WeO7U8gTGCWz08giNfNdXZv0li87MxAUF6gjkorPuZP83Iz3aefEGsi48Ctiaq0cZReztV
	Z8U2DtT1j5JKSL5DAMc4RGgW3C2kKBJcMAFpql3rZODe4VzGJETzDdS7YnshtehW4Cg01M
	XGGqj7q2oxQIemrbtI3DCOM1iIEaBIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-1BkWfrjNMAG8T13UpEugkQ-1; Mon, 24 Feb 2020 16:57:56 -0500
X-MC-Unique: 1BkWfrjNMAG8T13UpEugkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8737107B282;
	Mon, 24 Feb 2020 21:57:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D6C5C1D6;
	Mon, 24 Feb 2020 21:57:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5675018089C8;
	Mon, 24 Feb 2020 21:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLvpGX020468 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:57:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F27B61004C4B; Mon, 24 Feb 2020 21:57:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2711142374
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:57:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB5B800FCC
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-200--f4jtnGMNoupa3K_uHORuA-1; Mon, 24 Feb 2020 16:57:46 -0500
X-MC-Unique: -f4jtnGMNoupa3K_uHORuA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6LjT-0006S8-Ch; Mon, 24 Feb 2020 21:57:43 +0000
Date: Mon, 24 Feb 2020 13:57:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224215743.GA24044@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-15-willy@infradead.org>
	<SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200220134849.GV24185@bombadil.infradead.org>
	<20200220154658.GA19577@infradead.org>
	<20200220155452.GX24185@bombadil.infradead.org>
	<20200220155727.GA32232@infradead.org>
	<20200224214347.GH13895@infradead.org>
	<20200224215414.GR24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200224215414.GR24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLvpGX020468
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v7 14/24] btrfs: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 24, 2020 at 01:54:14PM -0800, Matthew Wilcox wrote:
> > First I think the implicit ARRAY_SIZE in readahead_page_batch is highly
> > dangerous, as it will do the wrong thing when passing a pointer or
> > function argument.
>=20
> somebody already thought of that ;-)
>=20
> #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array=
(arr))

Ok.  Still find it pretty weird to design a primary interface that
just works with an array type.


