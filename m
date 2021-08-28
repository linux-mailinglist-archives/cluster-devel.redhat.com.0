Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 547B03FB6CD
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 15:16:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-m8wj7wwbOnC4kRyZP8e3gw-1; Mon, 30 Aug 2021 09:15:58 -0400
X-MC-Unique: m8wj7wwbOnC4kRyZP8e3gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F8B71051470;
	Mon, 30 Aug 2021 13:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF06212C82;
	Mon, 30 Aug 2021 13:15:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCE14181A0F7;
	Mon, 30 Aug 2021 13:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17SMLGsZ007092 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 18:21:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A02B3568D6; Sat, 28 Aug 2021 22:21:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6CA568E0
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:21:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E96800B28
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:21:12 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-wwYyVKehMPGjROhh0hayrg-1; Sat, 28 Aug 2021 18:21:09 -0400
X-MC-Unique: wwYyVKehMPGjROhh0hayrg-1
Received: by mail-pj1-f54.google.com with SMTP id
	mj9-20020a17090b368900b001965618d019so1187355pjb.4; 
	Sat, 28 Aug 2021 15:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r6Li8Xzq3GZpRD4yRN9H4niugZXTcIcOHoay7QTmmqc=;
	b=cBgUeKQ5Cs8P4LLBgW6IK1MYMptC95OiM2OJ9MMSOQNO3bsJmTSeiL2ehsidE1OzEQ
	i2IgvgXSWzU7IZUnfnSHD1G3xgG7E9OR2q4Xx79R5Jl+zEhefq5OA6jsRT2XHF1XGXtw
	UTaw/hZD2ziWz5iLOpRHZvxPhmxvRcyXgq48QVzAT+cO7Am6IZfwPyjdnnFyAjdMnWM8
	EOAzG0zGyDrd6fmfbD8LZ92BlruogkpvFicjlSAvvwGTU4pc8TYcUAVBWG1x9Q4jV9p5
	fO0S2T/vmDTy9/A8u5wgve2GXDMtlkNcvyZf+VGHcZM9cFV5ukUejrH1oD3Z6H6zfpo1
	9TTg==
X-Gm-Message-State: AOAM5302s7XOPP/uaul+aJjYvquqON91kh9MU5OrFXqln/hK9K2WdIfJ
	1TYdQEmNlh6fM473HdnfP0nV6u2/El0eNnkgeL8hgkij
X-Google-Smtp-Source: ABdhPJz5Ffz08GjVQcWFqoF1crFop4nyJwqZjDMwOjo601G/TSenqG6Qmt+G6ELqJMjIOGz8touEqFLJCNdEjf1f3Wg=
X-Received: by 2002:a17:90a:eb0d:: with SMTP id
	j13mr18377241pjz.163.1630189268569; 
	Sat, 28 Aug 2021 15:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
	<87r1edgs2w.ffs@tglx> <YSqy+U/3lnF6K0ia@zeniv-ca.linux.org.uk>
	<YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
In-Reply-To: <YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
From: Tony Luck <tony.luck@intel.com>
Date: Sat, 28 Aug 2021 15:20:58 -0700
Message-ID: <CA+8MBbLLze0siip=h-2hR3XiceBFQCN7uh5BPvqYRyBXgT318g@mail.gmail.com>
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:15:50 -0400
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, X86-ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Borislav Petkov <bp@alien8.de>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 28, 2021 at 3:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> BTW, is #MC triggered on stored to a poisoned cacheline?  Existence of CLZERO
> would seem to argue against that...

No #MC on stores. Just on loads. Note that you can't clear poison
state with a series of small writes to the cache line. But a single
64-byte store might do it (architects didn't want to guarantee that
it would work when I asked about avx512 stores to clear poison
many years ago).

-Tony

