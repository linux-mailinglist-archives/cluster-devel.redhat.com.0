Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2CA190887
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Mar 2020 10:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585041031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGvr7xxLnotSMa/qCRktMsaGUqt+WmQafHoxOKMxR0o=;
	b=J2C8kGntfM3YEksFfoGRPgK1OHPXh8A0UE5W6rWzj4VKc9KzngU1xRQkZNVWWV/P0wbyc3
	TAAeDqTu6SvhKd37mZZ3esDaN/+OCDEmFz5POKFzN+0xRtHF8gVKJQGAZz/419pyR7kZCx
	ITNhzccr7IOthET0v43O3Yq8I5mPAHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-hdzkal0_MiyyN7E0J7-O6w-1; Tue, 24 Mar 2020 05:10:29 -0400
X-MC-Unique: hdzkal0_MiyyN7E0J7-O6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E34A318FF663;
	Tue, 24 Mar 2020 09:10:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47D6810027AC;
	Tue, 24 Mar 2020 09:10:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD8EB18089CD;
	Tue, 24 Mar 2020 09:10:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O98Z6T003413 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 05:08:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3802A2063208; Tue, 24 Mar 2020 09:08:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 346082063205
	for <cluster-devel@redhat.com>; Tue, 24 Mar 2020 09:08:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91C3D8007D2
	for <cluster-devel@redhat.com>; Tue, 24 Mar 2020 09:08:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363--GyLqp2TM5eRPe3VfS_B-w-1; Tue, 24 Mar 2020 05:08:30 -0400
X-MC-Unique: -GyLqp2TM5eRPe3VfS_B-w-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGf7B-0003Xw-12; Tue, 24 Mar 2020 08:40:49 +0000
Date: Tue, 24 Mar 2020 01:40:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200324084049.GB32036@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-13-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200323202259.13363-13-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O98Z6T003413
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 12/25] mm: Move end_index check out
	of readahead loop
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Mar 23, 2020 at 01:22:46PM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> By reducing nr_to_read, we can eliminate this check from inside the loop.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


