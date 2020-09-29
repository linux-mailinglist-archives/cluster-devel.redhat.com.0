Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD6E27D144
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Sep 2020 16:34:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-4jnxWm9TO-GKDWAtRrFTTw-1; Tue, 29 Sep 2020 10:34:27 -0400
X-MC-Unique: 4jnxWm9TO-GKDWAtRrFTTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BCE80BCC5;
	Tue, 29 Sep 2020 14:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFAA19C4F;
	Tue, 29 Sep 2020 14:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6B4544A45;
	Tue, 29 Sep 2020 14:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T5YCpW016133 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 01:34:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5888E2028DC0; Tue, 29 Sep 2020 05:34:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 532B5202DD56
	for <cluster-devel@redhat.com>; Tue, 29 Sep 2020 05:34:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58BC7101AA42
	for <cluster-devel@redhat.com>; Tue, 29 Sep 2020 05:34:09 +0000 (UTC)
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com
	[209.85.166.205]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-9vLqj73yPZelNc4woWtT0g-1; Tue, 29 Sep 2020 01:34:06 -0400
X-MC-Unique: 9vLqj73yPZelNc4woWtT0g-1
Received: by mail-il1-f205.google.com with SMTP id e3so2573203ilq.18
	for <cluster-devel@redhat.com>; Mon, 28 Sep 2020 22:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=KfWV0gnoumlsZJk50gbr1pEK2WkQDVbgVi8fBs3qwgg=;
	b=KunIZa5NAGNc5hdAHjEoI13Q7gX23yaB7LQnTLOHatu6Jq4LgTNbI3sFoA0v4cXsNR
	+LKJOZuFc0DYAwBaUXj/1lfSy0uYEE4wNpXoaeQ65KbUBbZ5mYbSQC+jdQTlfn/eYNXV
	S6cQ76adGp/zJQNBgH7LBeRmxk44m7MqcD4d0BKzX+ECWpEohfZWRI2sTePRzXLt5Et7
	O0oxuPXawTcfYI6/EqTRYLbwxrIVBauMzssuFhYwMyPsT5zdKMUjd6hBKiX24EjhAL61
	n2yA9sgtkWeZjgn2tmKu9OKlSbFQTf8BXCeOzyCRCetChW4g0zHbyahwj60c6sV/Yzci
	bxAQ==
X-Gm-Message-State: AOAM531dxIBRQc9c4Hk/0UpKK5Muya2KTxAQ2SeoSu4FKyw17hdyrbWU
	17B89dbMnr48qlVWvXgsFPe3I63MtUgPe9NYnbjsp5XsgJVg
X-Google-Smtp-Source: ABdhPJwbUrHiwJnq2FAlkdIXW3NQ3i/5IXxdyF7HO+N7tTecczltm5HcCn0fFrzgglyR/4GrYjNiHL/H+BnicYsWOYzmtkWC2k5H
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:ed3:: with SMTP id
	i19mr1536216ilk.188.1601357646098; 
	Mon, 28 Sep 2020 22:34:06 -0700 (PDT)
Date: Mon, 28 Sep 2020 22:34:06 -0700
In-Reply-To: <000000000000b6d7fd05b02037ef@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7770405b06d21ac@google.com>
From: syzbot <syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com>
To: agruenba@redhat.com, anprice@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 10:33:47 -0400
Subject: Re: [Cluster-devel] general protection fault in gfs2_withdraw
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 601ef0d52e9617588fcff3df26953592f2eb44ac
Author: Bob Peterson <rpeterso@redhat.com>
Date:   Tue Jan 28 19:23:45 2020 +0000

    gfs2: Force withdraw to replay journals and wait for it to finish

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=151d25e3900000
start commit:   7c7ec322 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=171d25e3900000
console output: https://syzkaller.appspot.com/x/log.txt?x=131d25e3900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6184b75aa6d48d66
dashboard link: https://syzkaller.appspot.com/bug?extid=50a8a9cf8127f2c6f5df
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c6a109900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d45ed3900000

Reported-by: syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com
Fixes: 601ef0d52e96 ("gfs2: Force withdraw to replay journals and wait for it to finish")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

