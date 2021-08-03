Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C32B43DF5FD
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Aug 2021 21:49:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-gwRZRW0AN4maNMnvgVf5Zg-1; Tue, 03 Aug 2021 15:49:41 -0400
X-MC-Unique: gwRZRW0AN4maNMnvgVf5Zg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56898799E0;
	Tue,  3 Aug 2021 19:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8058160C0F;
	Tue,  3 Aug 2021 19:49:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 240C6180BAB0;
	Tue,  3 Aug 2021 19:49:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 173JhZWd013271 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Aug 2021 15:43:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8C842166B4C; Tue,  3 Aug 2021 19:43:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B4A2166B4E
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 19:43:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 206B4866DF4
	for <cluster-devel@redhat.com>; Tue,  3 Aug 2021 19:43:32 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-121-XTPmp1jIMgOctfohSPtY7w-1; Tue, 03 Aug 2021 15:43:30 -0400
X-MC-Unique: XTPmp1jIMgOctfohSPtY7w-1
Received: by mail-lf1-f45.google.com with SMTP id m13so389172lfg.13
	for <cluster-devel@redhat.com>; Tue, 03 Aug 2021 12:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nGXjTo8qo5IxOBBXxPEhxEW50sCDdvHfqLDIjlbW7zc=;
	b=m3KAoS5oRu6HW33m7Hnm8kdkWkktjF/063JN5AIjevt4XYx+mNFie3RO2uVPp0QK+j
	NmtviGa73RwCbvyH9AoJg17IiggxqQH1kwnVHMAoyI8DSPaD2/VB+AyqTAmn/UK5lKV7
	qgUo5KP0Z+GtRhcOQ5qlmdEHJSk+MYU8xXEEuodt27IpWX1hdKQnhpyw0yF5lpucjd6D
	/yMVhjv0V66aiSLZLaXoDK8mhslxE6JnauOtJa/xKW9uVN8a5EB4f4ySkoDmDY1tkTl1
	9JXikiHWacRql8huOAf0p4lve+G+mXm71NaBzTRhtMJpDEhoqfqOGrLZ+ZSSDj5rd3z1
	WC2g==
X-Gm-Message-State: AOAM5335geW3XX3mGNvAFui0oS6SLTmAufNdaqM50fAz3kwliL5+B1A7
	aqrWr7/+jA4i7rfD/Ll19w9jXklzYlp5wyZe
X-Google-Smtp-Source: ABdhPJyHb9FR/9YNjCLSZ5qW5J/EfcrEDfE+sLoUSP0vuu97fCVr6MRH9LPl3sK3pPI+N/O7JTNmOg==
X-Received: by 2002:a05:6512:10c6:: with SMTP id
	k6mr5908269lfg.36.1628019808575; 
	Tue, 03 Aug 2021 12:43:28 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
	[209.85.167.48]) by smtp.gmail.com with ESMTPSA id
	t7sm1330013lfc.103.2021.08.03.12.43.27 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Aug 2021 12:43:28 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id a26so400689lfr.11
	for <cluster-devel@redhat.com>; Tue, 03 Aug 2021 12:43:27 -0700 (PDT)
X-Received: by 2002:ac2:4885:: with SMTP id x5mr1818950lfc.487.1628019807490; 
	Tue, 03 Aug 2021 12:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<20210803191818.993968-4-agruenba@redhat.com>
In-Reply-To: <20210803191818.993968-4-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Aug 2021 12:43:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiF7jkOrpCe8=s+s=xxw8NovYWfNpe+kVHZth4m0mV5XQ@mail.gmail.com>
Message-ID: <CAHk-=wiF7jkOrpCe8=s+s=xxw8NovYWfNpe+kVHZth4m0mV5XQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 03/12] Turn fault_in_pages_{readable,
	writeable} into fault_in_{readable, writeable}
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

On Tue, Aug 3, 2021 at 12:18 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Turn fault_in_pages_{readable,writeable} into versions that return the number
> of bytes faulted in instead of returning a non-zero value when any of the
> requested pages couldn't be faulted in.

Ugh. This ends up making most users have horribly nasty conditionals.

I think I suggested (or maybe that was just my internal voice and I
never actually vocalized it) using the same semantics as
"copy_to/from_user()" for fault_in_pages_{readable|writable}().

Namely to return the number of bytes *not* faulted in.

That makes it trivial to test "did I get everything" - becasue zero
means "nothing failed" and remains the "complete success" marker.

And it still allows for the (much less common) case of "ok, I need to
know about partial failures".

So instead of this horror:

-               if (!fault_in_pages_writeable(buf_fx, fpu_user_xstate_size))
+               if (fault_in_writeable(buf_fx, fpu_user_xstate_size) ==
+                               fpu_user_xstate_size)

you'd just have

-               if (!fault_in_pages_writeable(buf_fx, fpu_user_xstate_size))
+               if (!fault_in_writeable(buf_fx, fpu_user_xstate_size))

because zero would continue to be a marker of success.

                 Linus

