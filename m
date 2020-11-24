Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEC3F2C2D08
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 17:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606235861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AH8ZL5iC3Vj6vT2mnW7zA8a7u4PTsynV7rQaCKFUPfs=;
	b=af2Yl8cn+DMceEfL7ly5qyefrgMaCrD0cbhkodFCvTmWmGC3v2EGYQfD3ojrczb8BiuMsh
	UJya5X57DZzaPOGTXZWen7XURUyofB7fF1T60A06/Khj12XKh/F6v3zI4NnqCya1PTBzp7
	ueUPY07u9E2VkCYM5mNgMrsXFGbkBt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-MrVzYi6rMTOmqctsgweDGw-1; Tue, 24 Nov 2020 11:37:39 -0500
X-MC-Unique: MrVzYi6rMTOmqctsgweDGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6439587315C;
	Tue, 24 Nov 2020 16:37:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0349B63BA7;
	Tue, 24 Nov 2020 16:37:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9A89180954D;
	Tue, 24 Nov 2020 16:37:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOGbRVY014044 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 11:37:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D74F8A4C2; Tue, 24 Nov 2020 16:37:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8756810EB1
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 16:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723A8811E86
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 16:37:24 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-585-jGa1IOnxP3qhBA1y6XqFpw-1; Tue, 24 Nov 2020 11:37:22 -0500
X-MC-Unique: jGa1IOnxP3qhBA1y6XqFpw-1
Received: by mail-wr1-f72.google.com with SMTP id f4so7045335wru.21
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 08:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AH8ZL5iC3Vj6vT2mnW7zA8a7u4PTsynV7rQaCKFUPfs=;
	b=O/ow0egA3txCEntOHqwrEdoQNRJZx0K5hN72VtGXuVH/KmRNAdaPsa6maeT8kTqauE
	551EejsIX1PVGF3TPQbgxqs1eXGXZfsIN/9z1CMILYuThY5URSJa8vpOjqZqMloXYJ68
	EyTSmSECVEGHkrE/Mwsa2pNltmvUSsMUURsb/sB8/oTr0QEOmjmg08tICNlneUWGUcBo
	y2Sv8aeUs1tEHG7ES2R9WtJ+1CefdBIamFFyiEhSMZwiBLU2Xj3P4pbiXlYsuj5WC+Tr
	cWzcz2LAviY+UM5c94ijVMpM1gENdqZfblNXWOuj7q24v/VUxhtU3qD2Q0fXspofultk
	KY+g==
X-Gm-Message-State: AOAM53203eqUsmUFGRpOf/cLEWQzNZrj+ECd2xTI1NUAmW0dLvIaucAW
	aWbNGPKRFNwcFStr4Go1WBnqHEv8ov5+EJKiAPsZ6XUJCV31Zei/cwu7hWi9J3iyeQ65bGYPViM
	4erDGaVmx8o9rK2M3+uidXihCL1rqbGoQmQEz/Q==
X-Received: by 2002:adf:9124:: with SMTP id j33mr5989429wrj.376.1606235841272; 
	Tue, 24 Nov 2020 08:37:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwGErUO9gdx+aQMRND/04rpk0U5PbLFoQ0xHDI1eyttX0kd+RH40kQdYcfgnSl/BtCtXJzsTzgQ+REMBw4LUA=
X-Received: by 2002:adf:9124:: with SMTP id j33mr5989409wrj.376.1606235840993; 
	Tue, 24 Nov 2020 08:37:20 -0800 (PST)
MIME-Version: 1.0
References: <1537223283.29401746.1606232653565.JavaMail.zimbra@redhat.com>
	<192964445.29401792.1606232676707.JavaMail.zimbra@redhat.com>
In-Reply-To: <192964445.29401792.1606232676707.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 24 Nov 2020 17:37:09 +0100
Message-ID: <CAHc6FU6GNW1VOi6bf5Ci48x0gz4o-uqgn=87ZFe=FHyC547rXA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] gfs2: check for empty rgrp tree in
	gfs2_ri_update
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 4:44 PM Bob Peterson <rpeterso@redhat.com> wrote:
> If gfs2 tries to mount a (corrupt) file system that has no resource groups
> it still tries to set preferences on the first one, which causes a kernel null
> pointer dereference. This patch adds a check to function gfs2_ri_update so
> this condition is detected and reported back as an error.
>
> Reported-by: syzbot
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/rgrp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index f7addc6197ed..5e8eef9990e3 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -985,6 +985,10 @@ static int gfs2_ri_update(struct gfs2_inode *ip)
>         if (error < 0)
>                 return error;
>
> +       if (RB_EMPTY_ROOT(&sdp->sd_rindex_tree)) {
> +               fs_err(sdp, "no resource groups found in the file system.\n");
> +               return -ENOENT;
> +       }
>         set_rgrp_preferences(sdp);
>
>         sdp->sd_rindex_uptodate = 1;

Pushed to for-next, thanks.

Andreas

