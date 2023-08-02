Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A876CBC3
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Aug 2023 13:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690975649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tG/9RhsoOpqUYPDbY3A2SCrWREUkDCcVSurVLIMXES0=;
	b=VdLn5+nY5bD00H9edU8fL7B2Rg/NRwHbUIV/Z6jmZ6dewq+WRMuhWo+P0FBKktS5ecgf82
	vZ+5Xi//SWlaqCqUeyDrXMkGs9+N4/vA7A/Fj15lgKxheVPz4vfbRKBN3Z79WAXuBrfubh
	pHgx1q1GgwMX4Tr73AsYNHiZxdMZchs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-1jjGiMvzPXO8jqSv9ou4Jw-1; Wed, 02 Aug 2023 07:27:26 -0400
X-MC-Unique: 1jjGiMvzPXO8jqSv9ou4Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A78073C11C68;
	Wed,  2 Aug 2023 11:27:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF4F40C206F;
	Wed,  2 Aug 2023 11:27:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B8BE81946A74;
	Wed,  2 Aug 2023 11:27:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 674EF1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 11:19:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F41ED1454145; Wed,  2 Aug 2023 11:19:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBAE11454143
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 11:19:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00031008131
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 11:19:00 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-PAHefMAFPdKnBskTRJm5oQ-1; Wed, 02 Aug 2023 07:18:59 -0400
X-MC-Unique: PAHefMAFPdKnBskTRJm5oQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3a4261fc598so13598159b6e.2
 for <cluster-devel@redhat.com>; Wed, 02 Aug 2023 04:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690975138; x=1691579938;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tG/9RhsoOpqUYPDbY3A2SCrWREUkDCcVSurVLIMXES0=;
 b=G8jwf2xBsMofN1PDf2cVGqIZEEmBvGbMuH6k5KI3MMnArul4IME9uV8+dz1RqRZGPf
 uH1uZGYsWTb/a+Lt1VONy3A57lS2Es0qCzx9rAkN1BYP9a0NBXOcCQXBQAd6NP53+bH/
 eNatKYisBck6EkF2ItQia+smpo5Rmxzr7cPS7PgzBRhyeb83wlDHKR00fOSDdpO435jz
 gTrkaXAvyrbI0HWxxZQrXWSequAjk/IJ7TTOpWbHrLZuxSptTktbEm7wss4hpQjLWVfn
 P9/iR58guWWYY0mWk6IXhXuDJZQn1PNNur3mB1JEnlc4ffP/780o24GA0rzLlNQP48ns
 zpog==
X-Gm-Message-State: ABy/qLY7QEW8qyzH9sEbwxt434v6NYk9TqQxsqseyjKlLTIq9C0Hy26B
 6LM+0nT5VGbQavc2d/BlJe+w/6rcjBoAAbGyfalfuEABTfyXl7E=
X-Google-Smtp-Source: APBJJlFDaYXeuroNY34COc/l3laqrnv+Mv8wxy0p7P5oKzctisDOWKPhrtk27+nmEF2HhuHOaNFi3xaXqEHYz3SboaUPv0kmCzcW
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c2:b0:3a4:24bc:125f with SMTP id
 d2-20020a05680813c200b003a424bc125fmr26661106oiw.1.1690975138443; Wed, 02 Aug
 2023 04:18:58 -0700 (PDT)
Date: Wed, 02 Aug 2023 04:18:58 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073777d0601eed428@google.com>
From: syzbot <syzbot+list07452ddeb3cf4800d090@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 02 Aug 2023 11:27:13 +0000
Subject: [Cluster-devel] [syzbot] Monthly gfs2 report (Aug 2023)
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello gfs2 maintainers/developers,

This is a 31-day syzbot report for the gfs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/gfs2

During the period, 3 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 18 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3678    Yes   WARNING in folio_account_dirtied
                  https://syzkaller.appspot.com/bug?extid=8d1d62bfb63d6a480be1
<2> 2371    Yes   WARNING in __folio_mark_dirty (2)
                  https://syzkaller.appspot.com/bug?extid=e14d6cd6ec241f507ba7
<3> 501     Yes   kernel BUG in gfs2_glock_nq (2)
                  https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
<4> 71      Yes   INFO: task hung in gfs2_gl_hash_clear (3)
                  https://syzkaller.appspot.com/bug?extid=ed7d0f71a89e28557a77
<5> 52      Yes   WARNING in gfs2_check_blk_type
                  https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
<6> 3       Yes   BUG: unable to handle kernel NULL pointer dereference in gfs2_rgrp_dump
                  https://syzkaller.appspot.com/bug?extid=da0fc229cc1ff4bb2e6d
<7> 3       Yes   BUG: unable to handle kernel NULL pointer dereference in gfs2_rindex_update
                  https://syzkaller.appspot.com/bug?extid=2b32df23ff6b5b307565
<8> 1       Yes   BUG: sleeping function called from invalid context in gfs2_make_fs_ro
                  https://syzkaller.appspot.com/bug?extid=60369f4775c014dd1804

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

