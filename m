Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE9A8743
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Sep 2019 20:26:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E19B4C0568FD;
	Wed,  4 Sep 2019 18:26:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F645C22C;
	Wed,  4 Sep 2019 18:26:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D0211800B74;
	Wed,  4 Sep 2019 18:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84IQ7VY002292 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 14:26:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 757E36012D; Wed,  4 Sep 2019 18:26:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DEC8601B6
	for <cluster-devel@redhat.com>; Wed,  4 Sep 2019 18:26:04 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2B22C0718BD
	for <cluster-devel@redhat.com>; Wed,  4 Sep 2019 18:26:03 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id o18so7983850oie.0
	for <cluster-devel@redhat.com>; Wed, 04 Sep 2019 11:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=9syqALSVX4IRzye/wNqp4h6zcuJ6Dov993BW238l+s4=;
	b=YtzIzWTeXybv/Lpy6Jrvl1m28KybQaJJsxZwG8zO0G5RynujwjoLrf3lIseJGdhKYp
	bCRjCwIF6S6+/uSHZubH5LTiG4/k/tGmbUIpw3gyMWREAgGl7aEbDTMEWgCuS+YvZjrT
	lvXebtpaJjGm6ClOF1zotEf9PciFSd9swkeNvsP+Rp35HGLMoMUEbslLrlwmRLQlZN9L
	LPir/SCfqh1lv0JRXhW6HoNxoXtRZnYJJGYk8VNMEp3PmGR3z9C4Wluw1HrhCkkOxNVy
	SBHyXaVchWGQrJGvvfFoY1Sjjf9Esr8TLV4EvGS6Z3zUCjGgpD+xZHzHpYVRkL3+tlxz
	R4KA==
X-Gm-Message-State: APjAAAWXJ5WsVnnda032+Qs3DroMnaO0bgjxJlPdWPjZGdIy1MlCkPMr
	PtyHZ+xi3uWCTQvjIFpda0ldn+0u5xOVdZ6/vCuvQ9l4tAJ8n9cArEDL6dFFIon2DLsWsov7Ci2
	b+dg2RcdeDkxsscJCvJQx3uJ3pCA4J9hp/V20Yw==
X-Received: by 2002:a05:6830:1059:: with SMTP id
	b25mr31490407otp.95.1567621563447; 
	Wed, 04 Sep 2019 11:26:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEpwSmryyO1KGld+C9+oZ4DwtaegNySBfmC+1YDWS8cfe9XXhGiXr/IAaCOnjSWC+47XJ6sBXmFdKJnyreyUM=
X-Received: by 2002:a05:6830:1059:: with SMTP id
	b25mr31490394otp.95.1567621563229; 
	Wed, 04 Sep 2019 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190903074939.28503-1-agruenba@redhat.com>
In-Reply-To: <20190903074939.28503-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 4 Sep 2019 20:25:52 +0200
Message-ID: <CAHc6FU7_WW5Ot9+_jV4=_+UMrtqTHX6HQKPv2LHwPgMca9t_Bg@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Minor PAGE_SIZE arithmetic
	cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 04 Sep 2019 18:26:45 +0000 (UTC)

On Tue, Sep 3, 2019 at 9:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 69c4b77f127b..f95606f2157a 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -774,7 +774,7 @@ static int gfs2_write_disk_quota(struct gfs2_inode *ip, struct gfs2_quota *qp,
>         nbytes = sizeof(struct gfs2_quota);
>
>         pg_beg = loc >> PAGE_SHIFT;
> -       pg_off = loc % PAGE_SIZE;
> +       pg_off = loc & (PAGE_SIZE - 1);

Should have used offset_in_page() here. I'm fixing that.

Andreas

