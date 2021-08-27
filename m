Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3DC83F9F95
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 21:06:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-7K78dXA2PaGtv3fSF5b2Qg-1; Fri, 27 Aug 2021 15:06:05 -0400
X-MC-Unique: 7K78dXA2PaGtv3fSF5b2Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82D03CC627;
	Fri, 27 Aug 2021 19:06:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3564D60C04;
	Fri, 27 Aug 2021 19:06:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E17EA4A7C8;
	Fri, 27 Aug 2021 19:06:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RJ60Vm017069 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 15:06:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6D431A91F2; Fri, 27 Aug 2021 19:05:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F681A91F8
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:05:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3033F967604
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:05:55 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-498-a85eIT49Mvu_hkYQriXSgQ-1; Fri, 27 Aug 2021 15:05:53 -0400
X-MC-Unique: a85eIT49Mvu_hkYQriXSgQ-1
Received: by mail-lj1-f179.google.com with SMTP id m4so13122800ljq.8
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 12:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xurqpx2HBsUzvPtF9beAd23C15iGKZUtGtKLy9/65Yo=;
	b=kxbg17nskoeiJ8bJM0h6rhM0HH72ByBVTFTnGDzEG8yRZKsXPD/3jgdexrQ9svLHnn
	Q4zwTEMX26FCn831nDgPp6aAuqpUoTxk8I9IGimDWSVMpNB6mRj+bHtEwVHpLpTNidYg
	AiL6xrU8xXyRY35BlIT9TfxFQXEywx1CrxPxb1ciwjmEstwaUz6JV2TrCwh83DYOkQAX
	Gh5G6bOheFcmtPBxK+mIW6zBm/P+3zawYSTgAQ9L38s0M4LbJvtPSqimAyrUzgtWdyH6
	iixWRR+KerLKEYkMpbbyvrygegniKI+2yjhb+n0GFjFT63IdMnLdnRqw5sqEXu5EZCU2
	d94w==
X-Gm-Message-State: AOAM532AE2XkwLrZkSkvyzg4OBBut555rQ1bor+n/YjI8nAR2Tjmtwu+
	K4WiEobvDNY2wdLD3ZBdkxynwUOzcTriOgEI
X-Google-Smtp-Source: ABdhPJw9uPyJ9oD2dbWCKj7u2f0ew+jtHuSqhOh85aP0vYWcxRFpoXKb3nah3XV2pT3gWRLwMDzSyA==
X-Received: by 2002:a2e:9805:: with SMTP id a5mr8889822ljj.155.1630091150662; 
	Fri, 27 Aug 2021 12:05:50 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
	[209.85.167.48]) by smtp.gmail.com with ESMTPSA id
	h12sm666675lfg.134.2021.08.27.12.05.49 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 12:05:49 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id l2so8293360lfp.2
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 12:05:49 -0700 (PDT)
X-Received: by 2002:a05:6512:104b:: with SMTP id
	c11mr7660072lfb.201.1630091149264; 
	Fri, 27 Aug 2021 12:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
In-Reply-To: <YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Aug 2021 12:05:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
Message-ID: <CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 05/19] iov_iter: Introduce
	fault_in_iov_iter_writeable
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 11:52 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Again, the calling conventions are wrong.  Make it success/failure or
> 0/-EFAULT.  And it's inconsistent for iovec and non-iovec cases as it is.

Al, the 0/-EFAULT thing DOES NOT WORK.

The whole "success vs failure" model is broken.

Because "success" for some people is "everything worked".

And for other people it is "at least _part_ of it worked".

So no, 0/-EFAULT fundamentally cannot work, because the return needs
to be able to handle that ternary situation (ie "nothing" vs
"something" vs "everything").

This is *literally* the exact same thing that we have for
copy_to/from_user(). And Andreas' solution (based on my suggestion) is
the exact same one that we have had for that code since basically day
#1.

The whole "0/-EFAULT" is simpler, yes. And it's what
"{get|put}_user()" uses, yes. And it's more common to a lot of other
functions that return zero or an error.

But see above. People *need* that ternary result, and "bytes/pages
uncopied" is not only the traditional one we use elsewhere in similar
situations, it's the one that has the easiest error tests for existing
users (because zero remains "everything worked").

Andreas originally had that "how many bytes/pages succeeded" return
value instead, and yes, that's also ternary. But it means that now the
common "complete success" test ends up being a lot uglier, and the
semantics of the function changes completely where "0" no longer means
success, and that messes up much more.

So I really think you are barking entirely up the wrong tree.

If there is any inconsistency, maybe we should make _more_ cases use
that "how many bytes/pages not copied" logic, but in a lot of cases
you don't actually need the ternary decision value.

So the inconsistency is EXACTLY the same as the one we have always had
for get|put_user() vs copy_to|from_user(), and it exists for the EXACT
same reason.

IOW, please explain how you'd solve the ternary problem without making
the code a lot uglier.

              Linus

