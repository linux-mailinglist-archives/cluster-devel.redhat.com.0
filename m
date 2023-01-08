Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F466177B
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 18:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673199173;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=R1tQhMLwN4df2mTt6NSEvjv94KFR0xXR92Y8zCvhpFM=;
	b=HT1y43EoV652zXb8C7l0hMnJXduesa/S79TOymxAUiENZP+yu+0ydbGH8ETYg3gJ+s80c/
	4+eZdikvXMO4fKux7co7ebkMLpLHQUek/11gplQbdDoVvJhmJriIAI2mnTUYShc13chZ7p
	QRcRudrShDsnM0EF3A/7ImZwyA08XVc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-3hIb9ESuO9W1J_Fqqp3wug-1; Sun, 08 Jan 2023 12:32:49 -0500
X-MC-Unique: 3hIb9ESuO9W1J_Fqqp3wug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A7F1C05EA8;
	Sun,  8 Jan 2023 17:32:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4132A40ED76E;
	Sun,  8 Jan 2023 17:32:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07E9019459C4;
	Sun,  8 Jan 2023 17:32:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9BA711946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 17:32:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 449792026D68; Sun,  8 Jan 2023 17:32:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D5452026D4B
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 17:32:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E6A9380450C
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 17:32:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-PXGpecl5NGaAnQoa5aEI5w-1; Sun, 08 Jan 2023 12:32:44 -0500
X-MC-Unique: PXGpecl5NGaAnQoa5aEI5w-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pEZXC-00EdRV-2f; Sun, 08 Jan 2023 17:32:38 +0000
Date: Sun, 8 Jan 2023 09:32:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y7r+NkbfDqat9uHA@infradead.org>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-8-agruenba@redhat.com>
 <Y7W9Dfub1WeTvG8G@magnolia> <Y7XOoZNxZCpjCJLH@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y7XOoZNxZCpjCJLH@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v5 7/9] iomap/xfs: Eliminate the
 iomap_valid handler
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 07:08:17PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 04, 2023 at 09:53:17AM -0800, Darrick J. Wong wrote:
> > I wonder if this should be reworked a bit to reduce indenting:
> > 
> > 	if (PTR_ERR(folio) == -ESTALE) {
> 
> FYI this is a bad habit to be in.  The compiler can optimise
> 
> 	if (folio == ERR_PTR(-ESTALE))
> 
> better than it can optimise the other way around.

Yes.  I think doing the recording that Darrick suggested combined
with this style would be best:

	if (folio == ERR_PTR(-ESTALE)) {
		iter->iomap.flags |= IOMAP_F_STALE;
		return 0;
	}
	if (IS_ERR(folio))
		return PTR_ERR(folio);

