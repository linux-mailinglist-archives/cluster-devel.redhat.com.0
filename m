Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDDF1661B4
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 17:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582214490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4zBbeCoBm5LiND1MPv/95gky/t/gBZwdELsBb1zb0bY=;
	b=Z6DfUP/IG1b+vmVmzyJfhceZX2YtNSRvlSyPWGSjPGHp/zk3AstOyuzMiYsmtMah7tPXio
	0y4+7FL0+IV/Eq0g2FjmIuke9CReR0M4WMD94VPMoVTJ75a22kGbxGIHVd3ykhmDQz+pPb
	WDHTvbAiZXMcIo9yfe8DrHrU+jBLIZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-wj0e7L1YM32mgWHcMUCC-w-1; Thu, 20 Feb 2020 11:01:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 024AE18A5502;
	Thu, 20 Feb 2020 16:01:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDF4D27061;
	Thu, 20 Feb 2020 16:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5BAA18034E9;
	Thu, 20 Feb 2020 16:01:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KG1MUg028140 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 11:01:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07F4713AF75; Thu, 20 Feb 2020 16:01:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F318313AF73
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 16:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287071011E17
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 16:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-360-ZRXQJ-57MayGw3DxEpjSTQ-1; Thu, 20 Feb 2020 11:01:16 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4o3B-0005FU-UO; Thu, 20 Feb 2020 15:47:41 +0000
Date: Thu, 20 Feb 2020 07:47:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200220154741.GB19577@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-22-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-22-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: ZRXQJ-57MayGw3DxEpjSTQ-1
X-MC-Unique: wj0e7L1YM32mgWHcMUCC-w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KG1MUg028140
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 21/24] iomap: Restructure
	iomap_readpages_actor
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
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> By putting the 'have we reached the end of the page' condition at the end
> of the loop instead of the beginning, we can remove the 'submit the last
> page' code from iomap_readpages().  Also check that iomap_readpage_actor(=
)
> didn't return 0, which would lead to an endless loop.

I'm obviously biassed a I wrote the original code, but I find the new
very much harder to understand (not that the previous one was easy, this
is tricky code..).


