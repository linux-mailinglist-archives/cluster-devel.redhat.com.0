Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9AD102F70
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Nov 2019 23:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574203125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2wysd7Xx8YlfdH+/cLfqzoNopBBstQ0tOUtS1ux+OE4=;
	b=MVxyV8m2+PwWCyreV3iyO+30Fv98zQtv12Ci4hjdQTV1IdAmla0GULz33mxk4Ihi26LvLj
	tHnQM2tIZ+U+q7NwIQk0Aefp3nZMcjgXLLQl5EsoZv+5qDQXcdro3N9iZzUHsWdHv3KM2f
	eDw80t7zZRzeoqym6zaPW7wxN3a6Mys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-cRglUdP0OVmhhNc5hHsEOA-1; Tue, 19 Nov 2019 17:38:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A70061802CE3;
	Tue, 19 Nov 2019 22:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C1319C5B;
	Tue, 19 Nov 2019 22:38:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E058218089C8;
	Tue, 19 Nov 2019 22:38:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJMcDOB009499 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 17:38:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF15F201EC22; Tue, 19 Nov 2019 22:38:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB771201ECDE
	for <cluster-devel@redhat.com>; Tue, 19 Nov 2019 22:38:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98DDD185A78E
	for <cluster-devel@redhat.com>; Tue, 19 Nov 2019 22:38:11 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-268-vqECL0R4MGOUsr2yMoGZFQ-1; Tue, 19 Nov 2019 17:38:08 -0500
Received: by mail-oi1-f200.google.com with SMTP id l188so11499544oib.22
	for <cluster-devel@redhat.com>; Tue, 19 Nov 2019 14:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2wysd7Xx8YlfdH+/cLfqzoNopBBstQ0tOUtS1ux+OE4=;
	b=Du8iccHMLPJbeKK7BP3mp+blyFk4AfvvIkuCm+lICuGM9BtVGyVQ9YLdOxh786P+e3
	2Dxj4LKgGrCNLzW1YxNt9/EvSt6ExWObxP1jZWpLBk2FEyYYSwSSGpS9IenJxUTycnlY
	xDlyalYWhKa9G51p1VQZ2WP4QbUvLG4ZF9NIU8Bu2HpQ4tz/EsN9iTMr1sUQbts/0Q5z
	X7pE9zTJFnUW3jWiy3v6tSMLxGI0NkcvUfftc82yWlSu1PCuJxE1m0yxeSF7gyYw1T7h
	4wzVRmS4t6ON6IlW9WtOFkdJqeksZ/FIktMEa0rbxLdXtZfWQX2xdlcolYmCNOP5+vXQ
	UZdQ==
X-Gm-Message-State: APjAAAUKzCulrvH33623wjLtYh8wUYMvv1WRYUPoYmzZPfG7o+7JteI+
	4AlHeyupXiOldX1wpIu9QE+26mnzHKYrlYOhYE4ROeOyAMe6lGpygrKIhnvcyzR9pFGz7xajqeu
	40z8ntBNwzDfQIAlz/2cMl8mjvo5dq4PzvkLobA==
X-Received: by 2002:aca:901:: with SMTP id 1mr6443495oij.72.1574203087397;
	Tue, 19 Nov 2019 14:38:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZDuTgfCuUCTZJDGyxKBTuUc9i4bR8m5JWpIk4sApYq5TEYjwukuI+ScieS+pgGAMgLBeyp4Jp1CbrZqLxoDw=
X-Received: by 2002:aca:901:: with SMTP id 1mr6443482oij.72.1574203087147;
	Tue, 19 Nov 2019 14:38:07 -0800 (PST)
MIME-Version: 1.0
References: <590695545.35528985.1574181592698.JavaMail.zimbra@redhat.com>
	<693121786.35529468.1574181646510.JavaMail.zimbra@redhat.com>
In-Reply-To: <693121786.35529468.1574181646510.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 19 Nov 2019 23:37:56 +0100
Message-ID: <CAHc6FU7osBNEEjC3e8O0tsi9tD=qF7kAV_TaQV2SY53c0vzpAQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: vqECL0R4MGOUsr2yMoGZFQ-1
X-MC-Unique: cRglUdP0OVmhhNc5hHsEOA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJMcDOB009499
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v3] gfs2: clean up iopen glock mess
	in gfs2_create_inode
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bob,

On Tue, Nov 19, 2019 at 5:41 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, gfs2_create_inode had a use-after-free for the
> iopen glock in some error paths because it did this:
>
>         gfs2_glock_put(io_gl);
> fail_gunlock2:
>         if (io_gl)
>                 clear_bit(GLF_INODE_CREATING, &io_gl->gl_flags);
>
> In some cases, the io_gl was used for create and only had one
> reference, so the glock might be freed before the clear_bit().
> This patch tries to straighten it out by only jumping to the
> error paths where iopen is properly set, and moving the
> gfs2_glock_put after the clear_bit.

this patch fixes a glock refcounting bug and slightly cleans up
gfs2_create_inode; it's an obvious improvement. This has passed my
testing and I'd like to see this fixed in the upcoming merge window,
so I'm adding it to for-next.

Thanks,
Andreas


