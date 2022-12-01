Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC763F9D6
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Dec 2022 22:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669930235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=N4h80UNUS79jX4Y4VHbk2odBURDMrNuryh2RN0FwTUs=;
	b=g7jdesFURWol39mOLzAf4UOUXfppoENoTmQkUxN/z90vCfQK1b5KHwhBflaR5cOfaxt7Dm
	i3lavd55+s6KfZOeH7SFhRQAOktKlX+bAWVIQeOmy+xIuEFyI+41SCZdQjd9MG4eoaqEk6
	XppLOWTd4FphOYrPy2984KGD3AI/W9s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-q75IyKT4MnGH1yXapksW1Q-1; Thu, 01 Dec 2022 16:30:30 -0500
X-MC-Unique: q75IyKT4MnGH1yXapksW1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 830C5858F17;
	Thu,  1 Dec 2022 21:30:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD649C15BB4;
	Thu,  1 Dec 2022 21:30:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2097519465B2;
	Thu,  1 Dec 2022 21:30:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 90CD319465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Dec 2022 21:30:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6151740C94CF; Thu,  1 Dec 2022 21:30:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5959E40C94AA
 for <cluster-devel@redhat.com>; Thu,  1 Dec 2022 21:30:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3784F3815D28
 for <cluster-devel@redhat.com>; Thu,  1 Dec 2022 21:30:03 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-dwZXY47VMF2xywhd3Ms33w-1; Thu, 01 Dec 2022 16:30:01 -0500
X-MC-Unique: dwZXY47VMF2xywhd3Ms33w-1
Received: by mail-pf1-f171.google.com with SMTP id c15so3078962pfb.13
 for <cluster-devel@redhat.com>; Thu, 01 Dec 2022 13:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4h80UNUS79jX4Y4VHbk2odBURDMrNuryh2RN0FwTUs=;
 b=YnYE3j1Bmd0tffYVsEHHsEB8KZpO0Y64kMlhr7/6pRYaicWKu1YPrtG3QXPQzA/gNP
 sech6yKUCP6/1BL2jQhc6ZRZqEU8HNIdm3YNnRvNDcyADIfogt3W1PzWL37WqsQQYh5G
 eoll0WXb0rF9vstIObzgJRTPEiGwRf7YKBRtCNy66e8pxGLoFNg8LLEWTef/r8J3nMkN
 GRwpi1GAYxjR8r6ZQuyFmklOSHDINbbzYFh9UeeY9kJmgY/MwFvdwT6KzMRET1HTiCCY
 nEqUTzOQ7oJ0x3fJL3nHKrJGy74uqMSKdEbzrfDKUv1S0vIdb+q8UumH6WcA/smzHAkQ
 DWWQ==
X-Gm-Message-State: ANoB5pkLxwCJyjoc9jlc07C2zaKOQIi3rlvgPgEfAH7eInDu/wzhFS0e
 AQCfK0uRoItdkPshEBQCjfr2gw==
X-Google-Smtp-Source: AA0mqf5jBMwE7VJtXdUtb9MV4o9tCdBmLTQr+bzOQc7ZjJ/ZjrEiVNzds8k8js/z73QdAqb5M76IJw==
X-Received: by 2002:a62:79cc:0:b0:575:bd04:504c with SMTP id
 u195-20020a6279cc000000b00575bd04504cmr12486711pfc.72.1669930200568; 
 Thu, 01 Dec 2022 13:30:00 -0800 (PST)
Received: from dread.disaster.area (pa49-186-65-106.pa.vic.optusnet.com.au.
 [49.186.65.106]) by smtp.gmail.com with ESMTPSA id
 d33-20020a631d21000000b00477e0f7ab89sm2949537pgd.38.2022.12.01.13.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 13:30:00 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1p0r80-003N0l-GZ; Fri, 02 Dec 2022 08:29:56 +1100
Date: Fri, 2 Dec 2022 08:29:56 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20221201212956.GO3600936@dread.disaster.area>
References: <20221201160619.1247788-1-agruenba@redhat.com>
 <20221201180957.1268079-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221201180957.1268079-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [RFC v2 0/3] Turn iomap_page_ops into
 iomap_folio_ops
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
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2022 at 07:09:54PM +0100, Andreas Gruenbacher wrote:
> Hi again,
> 
> [Same thing, but with the patches split correctly this time.]
> 
> we're seeing a race between journaled data writes and the shrinker on
> gfs2.  What's happening is that gfs2_iomap_page_done() is called after
> the page has been unlocked, so try_to_free_buffers() can come in and
> free the buffers while gfs2_iomap_page_done() is trying to add them to
> the transaction.  Not good.
> 
> This is a proposal to change iomap_page_ops so that page_prepare()
> prepares the write and grabs the locked page, and page_done() unlocks
> and puts that page again.  While at it, this also converts the hooks
> from pages to folios.
> 
> To move the pagecache_isize_extended() call in iomap_write_end() out of
> the way, a new folio_may_straddle_isize() helper is introduced that
> takes a locked folio.  That is then used when the inode size is updated,
> before the folio is unlocked.
> 
> I've also converted the other applicable folio_may_straddle_isize()
> users, namely generic_write_end(), ext4_write_end(), and
> ext4_journalled_write_end().
> 
> Any thoughts?

I doubt that moving page cache operations from the iomap core to
filesystem specific callouts will be acceptible. I recently proposed
patches that added page cache walking to an XFS iomap callout to fix
a data corruption, but they were NAKd on the basis that iomap is
supposed to completely abstract away the folio and page cache
manipulations from the filesystem.

This patchset seems to be doing the same thing - moving page cache
and folio management directly in filesystem specific callouts. Hence
I'm going to assume that the same architectural demarcation is
going to apply here, too...

FYI, there is already significant change committed to the iomap
write path in the current XFS tree as a result of the changes I
mention - there is stale IOMAP detection which adds a new page ops
method and adds new error paths with a locked folio in
iomap_write_begin(). 

And this other data corruption (and performance) fix for handling
zeroing over unwritten extents properly:

https://lore.kernel.org/linux-xfs/20221201005214.3836105-1-david@fromorbit.com/

changes the way folios are looked up and instantiated in the page
cache in iomap_write_begin(). It also adds new error conditions that
need to be returned to callers so to implement conditional "folio
must be present and dirty" page cache zeroing from
iomap_zero_iter(). Those semantics would also have to be supported
by gfs2, and that greatly complicates modifying and testing iomap
core changes.

To avoid all this, can we simple move the ->page_done() callout in
the error path and iomap_write_end() to before we unlock the folio?
You've already done that for pagecache_isize_extended(), and I can't
see anything obvious in the gfs2 ->page_done callout that
would cause issues if it is called with a locked dirty folio...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

