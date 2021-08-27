Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1F23FA00A
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 21:33:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-ppMAZudrMyGsXXzXUUkjLw-1; Fri, 27 Aug 2021 15:33:34 -0400
X-MC-Unique: ppMAZudrMyGsXXzXUUkjLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BA2D1082922;
	Fri, 27 Aug 2021 19:33:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B8466A8FD;
	Fri, 27 Aug 2021 19:33:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 879EF181A0F2;
	Fri, 27 Aug 2021 19:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RJXRqx020243 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 15:33:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C92CE117DB3E; Fri, 27 Aug 2021 19:33:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5338117DB3D
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:33:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2314185A79C
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 19:33:23 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-JMAUjSv8OW6PMLJ3eop_GQ-1; Fri, 27 Aug 2021 15:33:21 -0400
X-MC-Unique: JMAUjSv8OW6PMLJ3eop_GQ-1
Received: by mail-lj1-f180.google.com with SMTP id p15so13286616ljn.3
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 12:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=noHCPSrtAkyzCrVsyQD6F8PSfdWl+QDD2xq/GV377n4=;
	b=q7jTYXQvNn62234NAu53fYZT/5ZB2hjdLQH45kS5rbz0eI12vH6BzWMPRyfRedR9bb
	EDp3OUbVQ1NGmIeIcd/Q0Ztdtx/sZOWu6A8TxZosOZYTOTwiNUCCYJyd0/E5LJ5RQCbL
	OCvjgVA5ykbKf+Z2ujbl0Wc7jkTI0KSNDVFvzcqgHgXD2U3NWC/d3cwk63YQvOt/oNFb
	BSzEITgjhLe/KVZnBzI4fo8UgzfxBMtbtan83YFnH2HTr75JmXBr+HQv3DvNxq2M3QOj
	MZSdy0cJfmUzUndXJK7MzpiEGGCtuHZ3Z4E/U5ZfEoIydwmfyoBmKTuu755vrziU5Ypi
	kHrQ==
X-Gm-Message-State: AOAM533DzL7oEixAMkuMcbp+8exZ4oBzxGvLrJ2g5aOU4m/ZxeWvqIqe
	iUJmUStv7qT6qzauMjFgEgfWYu1NSnTpFpb+
X-Google-Smtp-Source: ABdhPJwGHvgJwGO/OdXfG10hbWyivDQJyhpYnRAEwDyoIziSAJI1fK5Tlot0i064KNRsCukl2q4uhA==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr9108413lji.108.1630092799042; 
	Fri, 27 Aug 2021 12:33:19 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181])
	by smtp.gmail.com with ESMTPSA id z8sm672296lfs.177.2021.08.27.12.33.17
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 12:33:17 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id d16so13281108ljq.4
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 12:33:17 -0700 (PDT)
X-Received: by 2002:a05:651c:908:: with SMTP id
	e8mr8956231ljq.507.1630092796791; 
	Fri, 27 Aug 2021 12:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
In-Reply-To: <YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Aug 2021 12:33:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
Message-ID: <CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 12:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Could you show the cases where "partial copy, so it's OK" behaviour would
> break anything?

Absolutely.

For example, i t would cause an infinite loop in
restore_fpregs_from_user() if the "buf" argument is a situation where
the first page is fine, but the next page is not.

Why? Because __restore_fpregs_from_user() would take a fault, but then
fault_in_pages_readable() (renamed) would succeed, so you'd just do
that "retry" forever and ever.

Probably there are a number of other places too. That was literally
the *first* place I looked at.

Seriously. The current semantics are "check the whole area".

THOSE MUST NOT CHANGE.

              Linus

