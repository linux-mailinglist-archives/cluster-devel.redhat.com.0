Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F081F7920A9
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 09:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693898145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sPNtMyx9dQhQPl1DJA90m5nAO5TU7mG9kQJJOwLb8ao=;
	b=K6EK7ziEa/L3MB7Ns19d84h0TQVVi3pFcBrBeYa/AhPG1n99dXQQ3uQfDYvlU+uegEARa7
	m1OrOXuOQL3d5CqmuFfyXCHjA94L8QxYFR/utx4xTecNgDdSIopq75cEhSKiQz/a4D9B+P
	Db1U5zxqlgdi+Zkjgz3vJwVz3gPy9rA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-sCnmfRRzOveo3jpZG5yXfA-1; Tue, 05 Sep 2023 03:15:42 -0400
X-MC-Unique: sCnmfRRzOveo3jpZG5yXfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C08A38008B9;
	Tue,  5 Sep 2023 07:15:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F27A40C84A7;
	Tue,  5 Sep 2023 07:15:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EEB0319465B7;
	Tue,  5 Sep 2023 07:15:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF7C219465A2 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 01:55:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7FD2B1182E7; Tue,  5 Sep 2023 01:55:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7765A568FF
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 01:55:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A0751817903
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 01:55:34 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-cZpwPjqNP8qmR4QTOlUEZg-1; Mon, 04 Sep 2023 21:55:32 -0400
X-MC-Unique: cZpwPjqNP8qmR4QTOlUEZg-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bf75ca4e4fso21670385ad.0
 for <cluster-devel@redhat.com>; Mon, 04 Sep 2023 18:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693878931; x=1694483731;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sPNtMyx9dQhQPl1DJA90m5nAO5TU7mG9kQJJOwLb8ao=;
 b=P2HUx/qH6FCAX+Jlh1cXqE68dhZtCVXZkmGB7Zw3Pdga7+FEnSBSBUxCkw61nxBzO4
 7tbkOY1c0lCfE33qGhKbR28cYav9RBo4cHmMoy9ZUQSfX+S9mWXxHzoor1v2NJHPM5WP
 XcyeIjngKQiCvQ4251usxBUpYrkSwIgQh7ixuF5D/k3Y992Zm3xIzXNcOecVZNmGp2Fc
 jK1XDw/Rk/2Gi1gD0l5NHFJMcY2/mjcbDQsOdqUISlBY96nXOgk3vVSE0slmcpJppxl2
 mq9SjVoU2QPFOmiS54CyqQzK00KuS3nvz/gc8KEhnBVIPXZAfQetwceJxz1CS6qHQ409
 3LYA==
X-Gm-Message-State: AOJu0YzCyKT9/fkKru0t2oYkeG9PvMFfq9ldyvx1SsKTjQ+NeFNFk4Qw
 /Lh70JqDDI1UuEzkPQ6v4yikDnVZ+BvFepvGMp5WV9IIQEOE
X-Google-Smtp-Source: AGHT+IECie8x8G3Kd40oJ7FUPl9fPThLlspd8nesueC4aMYrTQx5d/3TjEaL/75cAMFp/sMx4sp81gZ0M+9VNXOrsJsAqh+LD5hT
MIME-Version: 1.0
X-Received: by 2002:a17:902:e808:b0:1b9:fef8:9af1 with SMTP id
 u8-20020a170902e80800b001b9fef89af1mr4179166plg.5.1693878931294; Mon, 04 Sep
 2023 18:55:31 -0700 (PDT)
Date: Mon, 04 Sep 2023 18:55:31 -0700
In-Reply-To: <00000000000050a49105f63ed997@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe1297060492eb88@google.com>
From: syzbot <syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, elver@google.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peterz@infradead.org, rpeterso@redhat.com, syzkaller-bugs@googlegroups.com, 
 valentin.schneider@arm.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 05 Sep 2023 07:15:38 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] general protection fault in
 gfs2_dump_glock (2)
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a8b76910e465d718effce0cad306a21fa4f3526b
Author: Valentin Schneider <valentin.schneider@arm.com>
Date:   Wed Nov 10 20:24:44 2021 +0000

    preempt: Restore preemption model selection configs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1633aaf0680000
start commit:   58390c8ce1bd Merge tag 'iommu-updates-v6.4' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1533aaf0680000
console output: https://syzkaller.appspot.com/x/log.txt?x=1133aaf0680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5eadbf0d3c2ece89
dashboard link: https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172bead8280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d01d08280000

Reported-by: syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com
Fixes: a8b76910e465 ("preempt: Restore preemption model selection configs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

