Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBC676A88
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Jan 2023 02:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674349963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yglf5/d++AlplV9cjceQFPFA0SEgKUVwP/drqJ91jzg=;
	b=OfyccetRBUYnHTovRf1Z0Bf1EGnlzlxw4xfqZKf4669sbZBNr5Tg7F/RxbyLu87bWywYRQ
	0LSB1Fl9Cq9MNSdObdFUn3UToC4Ss/KgjuJ+sy3ydWGN9Z50c33rZ+vrjPWOPfkU/aasu8
	29hJAO2UGEZA2TVk3zpJiMCJFyO2lyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-ux5vqww8OlqhD2sgnw6mUg-1; Sat, 21 Jan 2023 20:12:38 -0500
X-MC-Unique: ux5vqww8OlqhD2sgnw6mUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 363A0101A521;
	Sun, 22 Jan 2023 01:12:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A814F40C2005;
	Sun, 22 Jan 2023 01:12:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57BA11946589;
	Sun, 22 Jan 2023 01:12:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C3DE1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 01:12:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E20944078904; Sun, 22 Jan 2023 01:12:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAF840C6EC4
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 01:12:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 167C6101A521
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 01:12:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-aqNcyI5HOxWqpm2THXWqfw-1; Sat, 21 Jan 2023 20:12:31 -0500
X-MC-Unique: aqNcyI5HOxWqpm2THXWqfw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 32E58CE0AF0;
 Sun, 22 Jan 2023 01:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F310CC433D2;
 Sun, 22 Jan 2023 01:06:41 +0000 (UTC)
Date: Sat, 21 Jan 2023 17:06:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Message-Id: <20230121170641.121f4224a0e8304765bb4738@linux-foundation.org>
In-Reply-To: <20230121065755.1140136-1-hch@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] return an ERR_PTR from __filemap_get_folio v2
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Jan 2023 07:57:48 +0100 Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> __filemap_get_folio and its wrappers can return NULL for three different
> conditions, which in some cases requires the caller to reverse engineer
> the decision making.  This is fixed by returning an ERR_PTR instead of
> NULL and thus transporting the reason for the failure.  But to make
> that work we first need to ensure that no xa_value special case is
> returned and thus return the FGP_ENTRY flag.  It turns out that flag
> is barely used and can usually be deal with in a better way.
> 
> Note that the shmem patches in here are non-trivial and need some
> careful review and testing.

I'll hide for a while, awaiting that review.  Plus...

> Changes since v1:
>  - drop the patches to check for errors in btrfs and gfs2
>  - document the new calling conventions for the wrappers around
>    __filemap_get_folio
>  - rebased against the iomap changes in latest linux-next

This patchset doesn't apply to fs/btrfs/ because linux-next contains
this 6+ month-old commit:

commit 964688b32d9ada55a7fce2e650d85ef24188f73f                
Author:     Matthew Wilcox (Oracle) <willy@infradead.org>
AuthorDate: Tue May 17 18:03:27 2022 -0400
Commit:     Matthew Wilcox (Oracle) <willy@infradead.org>
CommitDate: Wed Jun 29 08:51:07 2022 -0400

    btrfs: Use a folio in wait_dev_supers()


Matthew, what's the story here?

