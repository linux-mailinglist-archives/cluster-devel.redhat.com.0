Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCA7DC18D
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Oct 2023 22:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698699923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1JmURPcvLtSqLUUbFA7SrmnbERd26AC5lme3Qx7nOkM=;
	b=QFen6455+BcE8RY3eJzTqwu3kaaY6g0mXV/6ST//Bx+4MewGGyjfr6GJsJPTAOgE/M6qjp
	uT4R2BKGQX/T6I5ZVV3bt1Gv74aVAEwOgi8hmVGzgXiJHmohWQlQIzFXcWNqjC9N8R1b4Q
	RS1aZQUm38ZBmpKraznX+ht2Uxbr1Cc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-e84rB2a6P--uixmTtLsUMg-1; Mon, 30 Oct 2023 17:05:19 -0400
X-MC-Unique: e84rB2a6P--uixmTtLsUMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 012A9810FC4;
	Mon, 30 Oct 2023 21:05:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 364D140C6EB9;
	Mon, 30 Oct 2023 21:05:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE6881946589;
	Mon, 30 Oct 2023 21:05:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A9D31946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Oct 2023 21:05:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76741C1596D; Mon, 30 Oct 2023 21:05:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBB0C1596C
 for <cluster-devel@redhat.com>; Mon, 30 Oct 2023 21:05:15 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D5AE382C965
 for <cluster-devel@redhat.com>; Mon, 30 Oct 2023 21:05:15 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-ABFDfPdfOcy4fAgZQg99zg-1; Mon, 30 Oct 2023 17:05:13 -0400
X-MC-Unique: ABFDfPdfOcy4fAgZQg99zg-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-5b7bf1c206fso2996244a12.2
 for <cluster-devel@redhat.com>; Mon, 30 Oct 2023 14:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698699912; x=1699304712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JmURPcvLtSqLUUbFA7SrmnbERd26AC5lme3Qx7nOkM=;
 b=heYHzqddjmDaDc7wJebOntiULPrUoiRvRsLIJqYguVqi6XObH2x336oxPFmH4N6axf
 hWlE4ryXFpk2JrDkB+iwUJpe4ioqRmVVURaEIWF+Z9e5oqPrPeI25Eg+A1Yw9GLA+5GY
 BplFuC9SRtGndKG2ftZFbqc4JYWuXNe4ZN5BzWIC71qwuGQxoumzWiLVJwhtYVXBqN/q
 HEKdQt2gOEnV2fEwBcQNUab6asqlVkYmmqjK+DU/jjJgHThG7iti++2iWIq8oQy2Auzs
 mrp/cAWYz9i+O5LkjIsPLSBkfGKuPSc/Oi+vRyU9AjpK5NQciOfAvJBMHUo7+CKnKkzk
 iW/g==
X-Gm-Message-State: AOJu0YxawAUfOja0Fm5ct7FTfaJybydaKT3TF3NOseQ07iz4Yd26w1SA
 rQKBSOvHCdpXVRVEqU/aIX2Y/rcSJPJnwM0+RbpqzNtBnVqbXBzZ3Mtlk10kUtAz0sutRjlSDyD
 lBMOWIBazZkLk7qO6Wl17TMI6zTG5HqJAmiG/1Q==
X-Received: by 2002:a17:902:bf44:b0:1ca:c490:8537 with SMTP id
 u4-20020a170902bf4400b001cac4908537mr8378146pls.14.1698699912581; 
 Mon, 30 Oct 2023 14:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzbZk3QaOS4ZLoC9Xi0ie7QckJKqDxiUMckdm8KX4ydz1J+XDcKYN3ZT+xrDzl974H1L6JMnNQ06VhK1wjIKY=
X-Received: by 2002:a17:902:bf44:b0:1ca:c490:8537 with SMTP id
 u4-20020a170902bf4400b001cac4908537mr8378130pls.14.1698699912248; Mon, 30 Oct
 2023 14:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000000c44b0060760bd00@google.com>
 <000000000000c92c0d06082091ee@google.com>
 <20231025032133.GA1247614@ZenIV>
In-Reply-To: <20231025032133.GA1247614@ZenIV>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 30 Oct 2023 22:05:00 +0100
Message-ID: <CAHc6FU4Zd0szGBzZBx212K4MgjFJAEMwD1jbTraw0ihMG14Z2w@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] WARNING: suspicious RCU usage
 in gfs2_permission
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
Cc: gfs2@lists.linux.dev, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 syzbot <syzbot+3e5130844b0c0e2b4948@syzkaller.appspotmail.com>,
 linux-fsdevel@vger.kernel.org, postmaster@duagon.onmicrosoft.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Al,

On Wed, Oct 25, 2023 at 5:29=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
> On Fri, Oct 20, 2023 at 12:10:38AM -0700, syzbot wrote:
> > syzbot has bisected this issue to:
> >
> > commit 0abd1557e21c617bd13fc18f7725fc6363c05913
> > Author: Al Viro <viro@zeniv.linux.org.uk>
> > Date:   Mon Oct 2 02:33:44 2023 +0000
> >
> >     gfs2: fix an oops in gfs2_permission
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D10b21c33=
680000
> > start commit:   2dac75696c6d Add linux-next specific files for 20231018
> > git tree:       linux-next
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D12b21c33=
680000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D14b21c33680=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6f8545e1ef7=
a2b66
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D3e5130844b0c0=
e2b4948
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D101c8d096=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D11a07475680=
000
> >
> > Reported-by: syzbot+3e5130844b0c0e2b4948@syzkaller.appspotmail.com
> > Fixes: 0abd1557e21c ("gfs2: fix an oops in gfs2_permission")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>
> Complaints about rcu_dereference() outside of rcu_read_lock().
>
> We could replace that line with
>         if (mask & MAY_NOT_BLOCK)
>                 gl =3D rcu_dereference(ip->i_gl);
>         else
>                 gl =3D ip->i_gl;
> or by any equivalent way to tell lockdep it ought to STFU.

the following should do then, right?

    gl =3D rcu_dereference_check(ip->i_gl, !(mask & MAY_NOT_BLOCK));

> BTW, the amount of rcu_dereference_protected(..., true) is somewhat depre=
ssing...
>
> Probably need to turn
>                 ip->i_gl =3D NULL;
> in the end of gfs2_evict_inode() into rcu_assign_pointer(ip->i_gl, NULL);

That's what commit 0abd1557e21c6 does already so there's nothing to fix, ri=
ght?

> and transpose it with the previous line -
>                 gfs2_glock_put_eventually(ip->i_gl);
>
> I don't think it really matters in this case, though - destruction of the=
 object
> it used to point to is delayed in all cases.  Matter of taste (and lockde=
p
> false positives)...

I don't understand. What would lockdep complain about here?

Thanks,
Andreas

