Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 624551FF121
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 14:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592481776;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F3B7POYganjcYcTK3xulmlzDnkNmuFC83gI/QGxJRTY=;
	b=VX9yQAk0kWjTxVHf4enjeNG8ta0UVA6SKzTnAZJitt+fGkHTcvP+lvFNegR8WlEZ/il7Lf
	VaphKcLDVUYCLDEhOrhJDeB0sgNgSBfmvrId2NASbweOng8c1DKlYx7wFjDspK4NHP0RbE
	asELSE/DyQTwoxC3ubffg03awTpXIfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-GnB6mMvkM8ONDsY35NWTKw-1; Thu, 18 Jun 2020 08:02:20 -0400
X-MC-Unique: GnB6mMvkM8ONDsY35NWTKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5996C107ACF7;
	Thu, 18 Jun 2020 12:02:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21F419C79;
	Thu, 18 Jun 2020 12:02:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51D38833C8;
	Thu, 18 Jun 2020 12:02:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HIYAkp010051 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 14:34:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5956E10BBCC2; Wed, 17 Jun 2020 18:34:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5456A10BBCC1
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 18:34:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A4DD833B45
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 18:34:07 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-XHCP1JDnOcqUQkxQiNJ3Uw-1; Wed, 17 Jun 2020 14:34:05 -0400
X-MC-Unique: XHCP1JDnOcqUQkxQiNJ3Uw-1
Received: by mail-il1-f200.google.com with SMTP id t69so2162942ilk.13
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 11:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=F3B7POYganjcYcTK3xulmlzDnkNmuFC83gI/QGxJRTY=;
	b=eDPlWUkc6j3cX1ssfpRe5xYBHutTskeyku6GtdUuswDHMiRn5l5Do9i7URYgxWyP7a
	Nlobi7cJsJ17ffocDx551jmEImqNW9pH18r282ywdYFXygs5+0WsqROKt+bO6ffouIVu
	NgN6bn6JjCLUJK5rkjOPgiCQktsp6lWewqggdc4c12IVqEMkAKAXFF0worJBZG4xi7LA
	/PxgIvguKHQJG1ceV7nKG7HjOz8IFJKPuw7nvyJQ/5jB6JgTXYEpT8BygDFU7VQKD5C8
	ZK9pLwsLTDJt/iuWiV+5RpKQ41uAwmlp6V2sW48U7YTE02/s6/aPbF1DYVSzvLdLY2Y0
	1fkA==
X-Gm-Message-State: AOAM532/CSi1w90qxmCxlynRgjPK5nNmMLLvHhGewaYKrA/xDt7mtnsV
	XXOMznduKhFLHYeXGoDphtApeMCgxcW+V+9rqg7/F5MGirp3
X-Google-Smtp-Source: ABdhPJygKKcZu/ebf2TevbrWJlM+0CuGBrPVjGvdAgLKjnmnW+3Wbg2+h5A3SrR7rk6IBnaFssLxIhPC1NUTeKocc3UNX41F5Ya9
MIME-Version: 1.0
X-Received: by 2002:a02:770b:: with SMTP id g11mr621320jac.69.1592418844130;
	Wed, 17 Jun 2020 11:34:04 -0700 (PDT)
Date: Wed, 17 Jun 2020 11:34:04 -0700
In-Reply-To: <0000000000000655c0057cd141f1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089c74405a84be7aa@google.com>
From: syzbot <syzbot+6174a6c5eba4b3cdd606@syzkaller.appspotmail.com>
To: agruenba@redhat.com, bp@alien8.de, cluster-devel@redhat.com,
	davem@davemloft.net, hpa@zytor.com, jon.maloy@ericsson.com,
	keescook@chromium.org, konrad.wilk@oracle.com, kuznet@ms2.inr.ac.ru,
	len.brown@intel.com, linux-kernel@vger.kernel.org, luto@amacapital.net, 
	mingo@redhat.com, netdev@vger.kernel.org, nstange@suse.de,
	puwen@hygon.cn, rpeterso@redhat.com, syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de, tipc-discussion@lists.sourceforge.net,
	wad@chromium.org, wang.yi59@zte.com.cn, x86@kernel.org,
	ying.xue@windriver.com, yoshfuji@linux-ipv6.org
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 08:02:09 -0400
Subject: Re: [Cluster-devel] WARNING: locking bug in __queue_work
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this bug was fixed by commit:

commit ea22eee4e6027d8927099de344f7fff43c507ef9
Author: Bob Peterson <rpeterso@redhat.com>
Date:   Wed Apr 29 13:45:54 2020 +0000

    gfs2: Allow lock_nolock mount to specify jid=X

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16fcf249100000
start commit:   fe5cdef2 Merge tag 'for-linus-5.1-2' of git://github.com/c..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=856fc6d0fbbeede9
dashboard link: https://syzkaller.appspot.com/bug?extid=6174a6c5eba4b3cdd606
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f6c7e3200000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101507fd200000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: gfs2: Allow lock_nolock mount to specify jid=X

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

