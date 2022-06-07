Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD075405C7
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jun 2022 19:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654623007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Cd64zesxXwO9DDUxUPRw9NFg82m3SyiLm8HJHcXtYxs=;
	b=A4LEbYzrwAUujJy/E922/pyOZAeG831fniuotftkgNrYQoE5fn8l1MfCmQFRudfq+slvXc
	L4AEF4MeKgtadVpCNpBYxKPLw4Yu7t/8jnMysMPrsYs149uKKDfWbBI+mtkg3XYPd4HLgN
	CzcFpYbovQ17EuOZSaIQ1eQn1VviZjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-Pf86ZX6YMW6QJ7sImpLE-w-1; Tue, 07 Jun 2022 13:30:06 -0400
X-MC-Unique: Pf86ZX6YMW6QJ7sImpLE-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 421AB181E06C;
	Tue,  7 Jun 2022 17:30:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 090CD2166B26;
	Tue,  7 Jun 2022 17:30:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 985C01947B8B;
	Tue,  7 Jun 2022 17:30:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D001019452D2 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Jun 2022 17:30:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A40CB1415109; Tue,  7 Jun 2022 17:30:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A06631415106
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 17:30:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87BA985A587
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 17:30:02 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-DNrAJOqmOhajzI4GSporiQ-1; Tue, 07 Jun 2022 13:30:01 -0400
X-MC-Unique: DNrAJOqmOhajzI4GSporiQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 f20-20020a05622a1a1400b00304eb093686so5662590qtb.5
 for <cluster-devel@redhat.com>; Tue, 07 Jun 2022 10:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Cd64zesxXwO9DDUxUPRw9NFg82m3SyiLm8HJHcXtYxs=;
 b=rSFOMNljyYxDl/kvef1k9HNesl5u80ixAVXptdXfTkR7/iFkYZ7Fb4M7Bb0SNoWLqt
 sdlX2y7bAza6Oh/dCY0s5V5/3OB0POyJT06bkIBpQzuKOoZn0P8rxlLhl5wCf1NQirSo
 KCGdYewdXZmHSUaaXp2DvCFz3JnBiQA6ems95RUWYGv1BU5cHq084OIBsmttOibOJwHI
 51qNQvCAtqpX/ZO8L0pGl8wCOAXN52Ij7yhl1iPARqVJVVyMfz6dAUZRhxU93MN2fmea
 kZYxV9BnxMRhMFKpTo+T59iv89ZIwCI05+079umFmOS3Oi30zzn8Ppdtw41+RWZYyHBK
 dh2Q==
X-Gm-Message-State: AOAM533fo9APEBCUdtEsd56fWmrdanoj7HC4dLiqzzZo6+0LNm2H9JQw
 RpaQVzy0fCOzIdWLt11ioUoSBJ32dopgMAp+6aZMSWp45WXxt/jq9iS7i3gD/WAVFoz/PgSAQiU
 zlw+pKcY+yy1sC2oIBL1A1xTM7bTcBllVxcd+cQ==
X-Received: by 2002:a37:510:0:b0:6a6:ab9e:1b80 with SMTP id
 16-20020a370510000000b006a6ab9e1b80mr12714400qkf.770.1654623000848; 
 Tue, 07 Jun 2022 10:30:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzBLb3AR0/c4UB2dMyC54NtqNuvP7ErFpaHdRPIuWyOScdvAhUmZE3B0ZcDDKCwgmCaug3oBt7gQ4WiS/BOaY=
X-Received: by 2002:a37:510:0:b0:6a6:ab9e:1b80 with SMTP id
 16-20020a370510000000b006a6ab9e1b80mr12714382qkf.770.1654623000642; Tue, 07
 Jun 2022 10:30:00 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 7 Jun 2022 13:29:49 -0400
Message-ID: <CAK-6q+gzQSbsfCEu5Gma_X7H16p0UipbK+nZeGNAqOi-czP+XA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] ANNOUNCE: Linux Distributed Lock Manager Viewer
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
Cc: lusk@mcs.anl.gov, chan@mcs.anl.gov, tz.stoyanov@gmail.com,
 linux-trace-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, song@kernel.org, linux-trace-devel@vger.kernel.org,
 gropp@mcs.anl.gov, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I've built with existing open source software a Linux DLM (Distributed
Lock Manager) viewer [0]. The Linux DLM subsystem can be found in
"fs/dlm" and its main users are gfs2, ocfs2 and cluster-md. It is like
the name already propagates a distributed lock manager for Linux
clusters. A cluster can have shared resources among several nodes. DLM
offers to protect shared resources against mutual access e.g. cluster
file system gfs2 which operates on shared block devices among several
nodes. The viewer offers a graphical view about the used lock states
over time in a cluster.

Therefore we need to capture Linux DLM traces on all cluster nodes.
This is done by using the trace-cmd record command with the time
synchronization feature between multiple Linux machines which are part
of the DLM cluster. Another tool is dlm2slog2 [1] reads the recorded
Linux trace files, merges and converts them into a "drawable" open
format known as "slog2" [2] by using the open slog2 sdk. The slog2sdk
contains a viewer named "jumpshot" [3] which can be used to visualize
the slog2 file. Originally this drawable format was invented to trace
MPI (Message Passing Interface) applications, however it does not
depend on MPI and offers a graphical tracing for distributed
applications which I adapted for DLM lock states.

The only "missing" piece here was the convert and merge of the
recorded Linux traces to the slog2 fileformat. Hereby I would like to
thank all trace-cmd developers (especially those who made the time
synchronization feature) and slog2sdk developers which offered they
work as open source so it was easy for me to make a small piece of
software "dlm2slog2" that works as a bridge between trace-cmd/linux
tracing and slog2sdk.

As the slog2sdk is written in Java I did Java bindings similar to the
existing python bindings for libtracecmd, similar classes, etc.
underneath it uses swig. I would like to try to bring those bindings
upstream to trace-cmd. It's _not_ necessary to have a Java dependency
on trace-cmd, there should be some trace-cmd-java package available
which installs the necessary swig library libctracecmdjava that offers
jni access to libtracecmd. As well a jar file which can be seen as a
library/python module and follows the same license as libtracecmd. The
alternative here would be to maintain an out-of-tree trace-cmd-java
package. I would like to hear some feedback for it, the current code
can be found at [4].

If you want to get started or simply see what this is all about
inclusive screenshots, see [0].

- Alex

[0] https://gitlab.com/netcoder/dlm2slog2/-/wikis/home
[1] https://gitlab.com/netcoder/dlm2slog2
[2] https://www.mcs.anl.gov/research/projects/perfvis/software/log_format/index.htm#SLOG-2
[3] https://www.mcs.anl.gov/research/projects/perfvis/software/viewers/index.htm#Jumpshot-4
[4] https://gitlab.com/netcoder/trace-cmd/-/commits/java_bindings

