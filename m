Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D4BF842C2B3
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Oct 2021 16:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634134602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dBnkrUxSaYZ31AWckgIFjfMapp8jUCihx/+zfyyumw0=;
	b=c0XcPETcW12/vcMCUonYpDpSbHTLjT5lAXjm51o/rRlg5XO57AUctq1z9EZX+MoIHmfO4/
	qC18AXIfWLOk+xbYwgLMACKtSYAShYwVpqdKfb6BcUk8KNqrzfTKhNcArgLSp18uswoaOB
	lIH2wpJmehgQUvItYqJzOpFV7MLP7g0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-A1r_Cef0NUC9_KFP8FUZGA-1; Wed, 13 Oct 2021 10:16:39 -0400
X-MC-Unique: A1r_Cef0NUC9_KFP8FUZGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C211015DA3;
	Wed, 13 Oct 2021 14:16:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB06460CA1;
	Wed, 13 Oct 2021 14:16:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EDE71800FDD;
	Wed, 13 Oct 2021 14:16:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DEGXlT015849 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 10:16:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 419881000D92; Wed, 13 Oct 2021 14:16:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF7D118637C
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 14:16:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BA06100B8DD
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 14:16:30 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-v1wiWRv1OS2_fJxt_Kh3Mw-1; Wed, 13 Oct 2021 10:16:27 -0400
X-MC-Unique: v1wiWRv1OS2_fJxt_Kh3Mw-1
Received: by mail-wr1-f72.google.com with SMTP id
	41-20020adf812c000000b00160dfbfe1a2so2123825wrm.3
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 07:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dBnkrUxSaYZ31AWckgIFjfMapp8jUCihx/+zfyyumw0=;
	b=QspWEMaR+l5VtceKbA6/9z736y9ooYww4GMqOOMEvzIZOjsgrwBOn6PVmQk2e41y2G
	bAefLrhDfJjgIoH6FUxQtMFs6y4uhxAZXltiY2S4sTbh2GUqbV4JlpOaTTxpa7oy00nk
	ZjvW6vJYa7t6itQHRxt76Ie0lX3KoVq75NnvNRfzIZtRhhZaUrB+vQoDtbkJZEZPwR70
	E6J6KDNE0YfZo/jI5oyDbEpZgo3srhqmNqxWQgigCBR+HcoAsuXBcHMN2AEC2pltLh4N
	aH1aQMUQdOSHPYbE+LMdLgjd3BjtUZyrcMzZsvXASQUDq1mDfUrcjjblXZZtle3lZe2K
	Mmxg==
X-Gm-Message-State: AOAM532q1iB5xrmD8Zj9dn9YW/TduZNIOxM+m/W9H+F0alQoSZztc0X9
	QE3kRkwGP57nHeSkdObQtfCIqUCSGn2xYYg53wBsm/ltZchhKraZ98YbloIeiyjGDLL1qR23otP
	vRfqCKmT38n2J+0pnlG730ksA8q+y73mO2sF55Q==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr39852953wrg.134.1634134585557;
	Wed, 13 Oct 2021 07:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsgUVRkGCZYksN7jTReZg9kQ2+4KSbN4/yTyyap4+p0ncdwMMG271DcZErX0+rS70OEhAcChRN9vY18El38Wo=
X-Received: by 2002:adf:c78d:: with SMTP id l13mr39852935wrg.134.1634134585421;
	Wed, 13 Oct 2021 07:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013140200.516387-1-aahringo@redhat.com>
In-Reply-To: <20211013140200.516387-1-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 13 Oct 2021 16:16:13 +0200
Message-ID: <CAHc6FU58Jn7=5memOSjdZBr5-tyJNs75WaEzm9xR8pwp3orERw@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH gfs2/for-next] gfs2: check context on
	gfs2_glock_put
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 4:02 PM Alexander Aring <aahringo@redhat.com> wrote:
> This patch adds a might_sleep() call into gfs2_glock_put() which could
> sleep if last reference is released. A comment leaves a note for the
> programmer that the only reason why it might can sleep is that the DLM
> api is called which is currently sleepable context. Checking on
> sleepable context in gfs2_glock_put() will show us problems earlier
> instead of seeing issues only if the last put occurred.

Thanks, I've pushed this to for-next.

Andreas

