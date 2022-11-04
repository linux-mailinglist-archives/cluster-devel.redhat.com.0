Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768961A1E0
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 21:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667592429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=s2O/qvDFRXf6wsYKSZLjcNGb+D8yn522RgYWCb7F9IA=;
	b=cx+wmpn+GVXKXxJHARfVmPT1jE5E8KKpaVaTD2wU9aMPkZhe996pIjxt/oNfj40dCe9RlY
	PZWFnINkP8hNNniXI7WiHn3VEWESswsBdFw02D3Cm9t1hBmWf0/2Hwy4o2DM1s46XFc+DM
	RF2C7+vDoIsYgjgGhxJmFBtYhT9UUm0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-xc0u7SE1OaOCrdAjtwuheg-1; Fri, 04 Nov 2022 16:07:04 -0400
X-MC-Unique: xc0u7SE1OaOCrdAjtwuheg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C2CC101A54E;
	Fri,  4 Nov 2022 20:07:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2D584EA4C;
	Fri,  4 Nov 2022 20:07:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D9F3E1946A42;
	Fri,  4 Nov 2022 20:07:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDBAF19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 20:07:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E32B4EA5C; Fri,  4 Nov 2022 20:07:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7610F4EA5A
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 20:07:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2334229AA386
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 20:07:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-574-hnEkbUYlMt-SYDBdXUoqHw-1; Fri,
 04 Nov 2022 16:06:56 -0400
X-MC-Unique: hnEkbUYlMt-SYDBdXUoqHw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1or2xl-007dIx-Tf; Fri, 04 Nov 2022 20:06:49 +0000
Date: Fri, 4 Nov 2022 20:06:49 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2Vw2UBkti7MeG5U@casper.infradead.org>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
 <20221104003235.GZ2703033@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20221104003235.GZ2703033@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
> At minimum, it needs to be documented, though I'd much prefer that
> we explicitly duplicate write_cache_pages() as write_cache_folios()
> with a callback that takes a folio and change the code to be fully
> multi-page folio safe. Then filesystems that support folios (and
> large folios) natively can be passed folios without going through
> this crappy "folio->page, page->folio" dance because the writepage
> APIs are unaware of multi-page folio constructs.

There are a lot of places which go through the folio->page->folio
dance, and this one wasn't even close to the top of my list.  That
said, it has a fairly small number of callers -- ext4, fuse, iomap,
mpage, nfs, orangefs.  So Vishal, this seems like a good project for you
to take on next -- convert write_cache_pages() to write_cache_folios()
and writepage_t to write_folio_t.

