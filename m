Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3853CEB57
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 21:30:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-XbB-3g0_OpCpnybjcnsFZQ-1; Mon, 19 Jul 2021 15:30:06 -0400
X-MC-Unique: XbB-3g0_OpCpnybjcnsFZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4944804141;
	Mon, 19 Jul 2021 19:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B24975D9DC;
	Mon, 19 Jul 2021 19:30:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7851F1809C99;
	Mon, 19 Jul 2021 19:30:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JJU0UG015969 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 15:30:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8C6AAEC94; Mon, 19 Jul 2021 19:30:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C33BEAECAA
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:29:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5CA589C7DC
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 19:29:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-fUU7CyLOP4u6LI2vTaVG-Q-1; Mon, 19 Jul 2021 15:29:54 -0400
X-MC-Unique: fUU7CyLOP4u6LI2vTaVG-Q-1
Received: by mail-lf1-f52.google.com with SMTP id 8so32033246lfp.9
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cvseTVwISQQYVhM74Otk0kHaj1gV421l1SCA3Nj6+8A=;
	b=SC1N07OBy8yxBkCcGn4NHJ5R2jSRrBwSjoozNKzPnRB+kfu24UGygvUb4QXQMCL0yn
	upWAZPCJlCbFoiCCJAQZjimwsL8YjXJeE/JjWbMwDWV/MMkVrSGrXoPHIA9Cs3mOtaYl
	0P5c8Ww6W99Uf7BkZWhGbKPH9EAPLeW8H9ixFgNwf8ioD8iwsSnj+60NV+vjhYP/f0Iv
	EKqLTYBpDSLrOM4lX9JQnHvUOap1HPs8QdHFqpxndvbqzCAuuidxYVeoG4x1ZD+PSjQk
	dmiO4eSyPkh9OcgN3s0bxIOijZjW7ZnKAeDNP0CDnM+PHG8gK9KgyeEq5rJc7/UYdXkR
	FbYw==
X-Gm-Message-State: AOAM531GClClq7zLsH+ce5zuaUW13C7wvkyh/vXRhr3ywpR7+b5pfnYU
	2NJgdisiCZW1B1Gp/qR+izAutwsg6denAYAC
X-Google-Smtp-Source: ABdhPJz1wt1HtdQsUHQ8WJvM+BiBn940ajNQ1ELfzuiGU4ZLvFu8rA1n78G0AiHH4BRoGiDO7aPO/A==
X-Received: by 2002:ac2:5b41:: with SMTP id i1mr18810972lfp.348.1626722992321; 
	Mon, 19 Jul 2021 12:29:52 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
	[209.85.167.51]) by smtp.gmail.com with ESMTPSA id
	25sm1358559lfr.101.2021.07.19.12.29.51 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Jul 2021 12:29:51 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id f30so32134428lfj.1
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 12:29:51 -0700 (PDT)
X-Received: by 2002:a05:6512:404:: with SMTP id
	u4mr18798424lfk.40.1626722990987; 
	Mon, 19 Jul 2021 12:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210718223932.2703330-1-agruenba@redhat.com>
	<20210718223932.2703330-6-agruenba@redhat.com>
In-Reply-To: <20210718223932.2703330-6-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jul 2021 12:29:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3p41a-=7FFf36sYBQP750ys6CKi0S7JNiCSatY5-7og@mail.gmail.com>
Message-ID: <CAHk-=wh3p41a-=7FFf36sYBQP750ys6CKi0S7JNiCSatY5-7og@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v2 5/6] iov_iter: Introduce
	ITER_FLAG_FAST_ONLY flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 3:40 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Introduce a new ITER_FLAG_FAST_ONLY flag

I think the code is fine, but I think it might be best to call this
"ITER_FLAG_NOIO" or something like that.

The "FAST_ONLY" name makes sense in the context of
"get_user_pages_fast()" where we have that "fast" naming (and the long
history too). But I don't think it makes much sense as a name in the
context of iov_iter.

                   Linus

