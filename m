Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9772C50
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:27:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F16CC307D985;
	Wed, 24 Jul 2019 10:27:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C4C119C70;
	Wed, 24 Jul 2019 10:27:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E4AA1800206;
	Wed, 24 Jul 2019 10:27:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OARLCo016600 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:27:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB12A60603; Wed, 24 Jul 2019 10:27:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D136560A35;
	Wed, 24 Jul 2019 10:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2810DC028353;
	Wed, 24 Jul 2019 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pZ4ZH9VPxiZxDx+7KKKjsqUsVYAmA4pcQo2TkCljiIY=;
	b=GItij1NPGpSPQTTUaEh+NMe4m
	kcsJ3XPH2NGzqYzuJcYfMfKn7/enbzExM8qQlf4XkdmEpE0lfEZBBp+w8GNJCJCuhAQVfg4uoT8T/
	DCj0Or1bb4dx827Z3UOXZ45BSd//IY2t2RUVkAwyqwVprjvlUdvKo/rPhWK17AlynjVCuyUlLIagf
	rgHD4dnrZGHS6GJiO/4meI6dtFWAwHDxd4LHq+Ky83vpWxzig09Lzw5xqnB5DdLrJGlfqhu8iVKUD
	O3tkD0rR0gr3o4WDM66hjS5yah6/3+b2vY/RGiQxYzZfrql/TpPxujY7T7H2abgvCQbms+ZGhmTx2
	T2iFxIoLA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hqEUQ-0007to-QA; Wed, 24 Jul 2019 10:27:18 +0000
Date: Wed, 24 Jul 2019 03:27:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <20190724102718.GA30071@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
	<2986ed32-9aad-8e9c-1373-1402b34e65ac@redhat.com>
	<20190724100207.GA7916@infradead.org>
	<380199a4-1864-d61a-1b9c-f21d4f3f8a32@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380199a4-1864-d61a-1b9c-f21d4f3f8a32@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 24 Jul 2019 10:27:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 24 Jul 2019 10:27:19 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 24 Jul 2019 10:27:38 +0000 (UTC)

On Wed, Jul 24, 2019 at 11:22:46AM +0100, Steven Whitehouse wrote:
> and it would have the same effect, so far as I can tell. I don't mind
> changing it, if that is perhaps a clearer way to write the same thing,
> rather than &ip->i_inode;

The cleanest thing is to not rely on any of that magic and write it
like all other file systems:

	ip = kmem_cache_alloc
	if (!ip)
		retuturn NULL;

	...

	return &ip->i_inode;

Absolutely not point in trying to be clever here.

