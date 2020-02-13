Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3FB15B8B3
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Feb 2020 05:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581568761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jcltm3yM46UiJbF5dmyBivZyB3786j/TucHv01otbBk=;
	b=C0ut0VqemT3CG2fSJNNUEwIY6O9HH4x5ki51HPgKPA51jmND6k5kM7ieXl6re+AWpv+LRa
	nGnbA/r5S3Gt1ycjm1c8ianwgv3qtaC2zqbU4QM/pIfO9ZfdD4LVkUgo3cxwxtQ8wOsDB1
	r4f2eE9ERD5OVaEj4Lhpj/oqKdhcvjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-4S1wrjo3MD28ztP7H-SGQQ-1; Wed, 12 Feb 2020 23:39:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8D88017CC;
	Thu, 13 Feb 2020 04:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8B560BF1;
	Thu, 13 Feb 2020 04:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EABD8B2A7;
	Thu, 13 Feb 2020 04:39:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D4cxEX004291 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 23:38:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B92F72093CC1; Thu, 13 Feb 2020 04:38:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B47BE2026D67
	for <cluster-devel@redhat.com>; Thu, 13 Feb 2020 04:38:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 509B9803291
	for <cluster-devel@redhat.com>; Thu, 13 Feb 2020 04:38:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-425-AP6DRjprPmWt_spdN7iBJw-1;
	Wed, 12 Feb 2020 23:38:54 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
	[73.231.172.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 18ED8206D7;
	Thu, 13 Feb 2020 04:38:53 +0000 (UTC)
Date: Wed, 12 Feb 2020 20:38:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Message-Id: <20200212203852.8b7e0b28974e41227bd97329@linux-foundation.org>
In-Reply-To: <20200125013553.24899-1-willy@infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
Mime-Version: 1.0
X-MC-Unique: AP6DRjprPmWt_spdN7iBJw-1
X-MC-Unique: 4S1wrjo3MD28ztP7H-SGQQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D4cxEX004291
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 00/12] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Jan 2020 17:35:41 -0800 Matthew Wilcox <willy@infradead.org> wro=
te:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This series adds a readahead address_space operation to eventually
> replace the readpages operation.  The key difference is that
> pages are added to the page cache as they are allocated (and
> then looked up by the filesystem) instead of passing them on a
> list to the readpages operation and having the filesystem add
> them to the page cache.  It's a net reduction in code for each
> implementation, more efficient than walking a list, and solves
> the direct-write vs buffered-read problem reported by yu kuai at
> https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huaw=
ei.com/

Unclear which patch fixes this and how it did it?


