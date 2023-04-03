Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C046D3D44
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 08:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680503051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=W7w4rGa/weBc1zd5RCUfFwg9my+z3GfiaxEfVPR6qPM=;
	b=LB2frmfps/0fLcbVsoa8AN9VTdXglvvunN2LWsV7SZaDv6ro8RI7e7YRVu5wZ7iTIbhN+J
	Xqofa6qcM2YM77NfI+giaFZRL6IS6smAcv8b6DmGRaUIwV9AE5tw7VgSQOBNkGmx1+2mvb
	nDWOcYHg089SPvyLvT+zR08HnqMjhVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-dHqBBW1xMCqqRa2lRcNuSg-1; Mon, 03 Apr 2023 02:24:09 -0400
X-MC-Unique: dHqBBW1xMCqqRa2lRcNuSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 582C5101A550;
	Mon,  3 Apr 2023 06:24:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11FE72166B29;
	Mon,  3 Apr 2023 06:24:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C3C919465B1;
	Mon,  3 Apr 2023 06:24:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC8DA1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Apr 2023 06:24:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA69240C20FA; Mon,  3 Apr 2023 06:24:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2CCF40C83A9
 for <cluster-devel@redhat.com>; Mon,  3 Apr 2023 06:24:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B0685A588
 for <cluster-devel@redhat.com>; Mon,  3 Apr 2023 06:24:02 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-j0YAscM2MVyci1VxDHM48A-1; Mon, 03 Apr 2023 02:24:00 -0400
X-MC-Unique: j0YAscM2MVyci1VxDHM48A-1
Received: by mail-lj1-f179.google.com with SMTP id s20so8822402ljp.7
 for <cluster-devel@redhat.com>; Sun, 02 Apr 2023 23:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680503039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7w4rGa/weBc1zd5RCUfFwg9my+z3GfiaxEfVPR6qPM=;
 b=CiPjYkpGUpodT9VCLH40JQf/hUsEv5OAsNSlUYClxL96VOnR42+fzW4R6Cvw9JZI0k
 BiC0K7NaznRPCTPNWJekpsoSTBl7lo7OT02QXoRhd1zg5JhA9XY7IkjeMz3rN0h1qVM+
 FsDOeSo/t2Ya8CAtIWu6ewfiVqv5nqBJBtLHauf3/UHwpTvUXw8lLxVynA04yHkUHApO
 C7Sqg5YokgDS7vExuXCbCu/2kP/vnJjNG7vuoNADylJD86o/KfRq6t6cZBGlym6tFwII
 eYlXgudP9JpRXy8/kqgGe4pWBu2gIl0A+W3QJRntKXqKrtYs0bla1vurFg5ilm+acd7X
 gx6w==
X-Gm-Message-State: AAQBX9f43uRY4l6odf/AAWDgTnKMy+egr4jMoDQgoL+UGF8HGiUqvqz/
 +HiDaGe63G8oajiGFnDurtLgApicIRzaQDuhomd6qQ==
X-Google-Smtp-Source: AKy350bJP8hcMb0K78DAucUuYayCrBxYFM/TvgmfmxSZKvb+iazC1gPiY1hRi8e9bdoSA0h6qpcLdhF83FqJ5pksWI0=
X-Received: by 2002:a05:651c:104d:b0:298:b32c:e4f0 with SMTP id
 x13-20020a05651c104d00b00298b32ce4f0mr10594874ljm.8.1680503038799; Sun, 02
 Apr 2023 23:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b9753505eaa93b18@google.com>
 <00000000000084824b05f7a66a52@google.com>
In-Reply-To: <00000000000084824b05f7a66a52@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 3 Apr 2023 08:23:46 +0200
Message-ID: <CACT4Y+aPAjP_2ay89aqTzZxaGEMX9rNncJOfaw9++gOsADZyzw@mail.gmail.com>
To: syzbot <syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [syzbot] [cluster?] possible deadlock in
 freeze_super (2)
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Mar 2023 at 15:43, syzbot
<syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit b66f723bb552ad59c2acb5d45ea45c890f84498b
> Author: Andreas Gruenbacher <agruenba@redhat.com>
> Date:   Tue Jan 31 14:06:53 2023 +0000
>
>     gfs2: Improve gfs2_make_fs_rw error handling
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=117e2e29c80000
> start commit:   4a7d37e824f5 Merge tag 'hardening-v6.3-rc1' of git://git.k..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8b969c5af147d31c
> dashboard link: https://syzkaller.appspot.com/bug?extid=be899d4f10b2a9522dce
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11484328c80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127093a0c80000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: gfs2: Improve gfs2_make_fs_rw error handling
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix: gfs2: Improve gfs2_make_fs_rw error handling

