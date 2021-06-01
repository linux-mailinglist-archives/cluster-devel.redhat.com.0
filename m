Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9B396D19
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Jun 2021 08:00:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-G3WXU3_gPqyxu8YPC840kA-1; Tue, 01 Jun 2021 02:00:39 -0400
X-MC-Unique: G3WXU3_gPqyxu8YPC840kA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC84180FD6A;
	Tue,  1 Jun 2021 06:00:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E83B96B8E8;
	Tue,  1 Jun 2021 06:00:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A54CB1801029;
	Tue,  1 Jun 2021 06:00:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15160Yts013969 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Jun 2021 02:00:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E45B72155D1D; Tue,  1 Jun 2021 06:00:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA8B2155D16
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 06:00:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84DF3858F0D
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 06:00:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-dS_WblXKNF-BzuKO_fYR_A-1; Tue, 01 Jun 2021 02:00:27 -0400
X-MC-Unique: dS_WblXKNF-BzuKO_fYR_A-1
Received: by mail-lj1-f180.google.com with SMTP id f12so17646636ljp.2
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 23:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FMK+BlVA/bqQ4G3j0umpuAtgbjll4fk10VR8BwqsbnM=;
	b=FO1NfSEfDBoUTzqebzmOvvt6EUfzCVqi0LMysn1juoc6LxJXuSA865DX1ydhiPXsUq
	nkbfArfBHm5KzwW+u9clFuyZ4u7TUzOCt6TRlrh4sGvg8TjXDxwJTYYN/ahbKPXtaE+J
	T1Fb9a4AdLk/+NvRlBj4ZnTomuUFli2zoTxQxkVARuwxvf7HMU/LxDw6e5Yk83BIRAJ0
	QGv5Pi8tjyqo+2hqgauf4H/KGCjbyZxkls/pYSWtQ4f04bHzzRa+wsl9beXa0SBoCx04
	koSjk432p2jyNYcB6HmNkmJT4tO410WrbGuKfg9JNyKP3z8sgbkEV0cz+pEpykY2NJxL
	A2Ow==
X-Gm-Message-State: AOAM5318DafbXYGVJkPd7xv7CWa/SqKhU/93U1gkiSYsExuSoiw1D7Gp
	496FaBNBxuJh6RzFk8rl67LaNxPDlLA475NU
X-Google-Smtp-Source: ABdhPJyQZzYw0SR4EB2UREPL//foEOJjvlA88cPzFoEVra1VceunTASTi1vaMRseIWWDVJGNf+WxAw==
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr19550990ljn.115.1622527226122;
	Mon, 31 May 2021 23:00:26 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177]) by smtp.gmail.com with ESMTPSA id
	d7sm1570686lfg.253.2021.05.31.23.00.25 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 May 2021 23:00:25 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id a4so17630628ljd.5
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 23:00:25 -0700 (PDT)
X-Received: by 2002:a2e:9644:: with SMTP id z4mr1911003ljh.507.1622527224567; 
	Mon, 31 May 2021 23:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-5-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 20:00:08 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
Message-ID: <CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [RFC 4/9] gfs2: Fix mmap + page fault deadlocks
	(part 1)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 7:01 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Fix that by recognizing the self-recursion case.

Hmm. I get the feeling that the self-recursion case should never have
been allowed to happen in the first place.

IOW, is there some reason why you can't make the user accesses always
be doen with page faults disabled (ie using the "atomic" user space
access model), and then if you get a partial read (or write) to user
space, at that point you drop the locks in read/write, do the "try to
make readable/writable" and try again.

IOW, none of this "detect recursion" thing. Just "no recursion in the
first place".

That way you'd not have these odd rules at fault time at all, because
a fault while holding a lock would never get to the filesystem at all,
it would be aborted early. And you'd not have any odd "inner/outer"
locks, or lock compatibility rules or anything like that. You'd
literally have just "oh, I didn't get everything at RW time while I
held locks, so let's drop the locks, try to access user space, and
retry".

Wouldn't that be a lot simpler and more robust?

Because what if the mmap is something a bit more complex, like
overlayfs or usefaultfd, and completing the fault isn't about gfs2
handling it as a "fault", but about some *other* entity calling back
to gfs2 and doing a read/write instead? Now all your "inner/outer"
lock logic ends up being entirely pointless, as far as I can tell, and
you end up deadlocking on the lock you are holding over the user space
access _anyway_.

So I literally think that your approach is

 (a) too complicated

 (b) doesn't actually fix the issue in the more general case

But maybe I'm missing something.

              Linus

                    Linus

